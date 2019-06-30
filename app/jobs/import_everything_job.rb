# frozen_string_literal: true

class ImportEverythingJob < ApplicationJob
  queue_as :default

  def perform
    @backup_file = JSON.parse(
      File.read(File.open(File.join(Rails.root, 'public', 'backup.json')))
    )

    @generations = @backup_file.dig('generations')
    @candies = @backup_file.dig('candies')
    @types = @backup_file.dig('types')
    @attack_categories = @backup_file.dig('attack_categories')
    @attacks = @backup_file.dig('attacks')
    @item_categories = @backup_file.dig('item_categories')
    @items = @backup_file.dig('items')
    @pokemons = @backup_file.dig('pokemons')
    @eggs = @backup_file.dig('eggs')
    @evolutions = @backup_file.dig('evolutions')
    @alternative_skins = @backup_file.dig('alternative_skins')
    @special_researches = @backup_file.dig('special_researches')

    clear_everything
    create_generations if @generations
    create_candies if @candies
    create_types if @types
    create_types_effectivenesses if @types
    create_moves if @attacks
    create_items if @items
    create_pokemons if @pokemons
    create_eggs if @eggs
    create_evolutions if @evolutions
    # create_alternative_skins if @alternative_skins
    # create_special_researches if @special_researches
  end

  private

  def clear_everything
    Generation.destroy_all
  end

  # == CREATE GENERATIONS ======================================================

  def create_generations
    @generations.each do |g|
      create_generation(g) unless Generation.find_by(name: g['name'])
    end
  end

  def create_generation(generation)
    Generation.create(
      uid: generation['id'],
      available: generation['on_prod'],
      name: generation['name'],
      locale: :fr
    )
  end

  # == CREATE CANDIES ==========================================================

  def create_candies
    @candies.each do |candy|
      get_candy(candy) unless Candy.where(name: candy['name']).first
    end
  end

  def get_candy(candy)
    new_candy = Candy.create(
      primary_color: candy['primary_color'],
      secondary_color: candy['secondary_color']
    )

    Candy::Translation.create(
      candy_id: new_candy.id,
      name: candy['name'],
      locale: :fr
    )

    Candy::Translation.create(
      candy_id: new_candy.id,
      name: candy['name_en'],
      locale: :en
    )
  end

  # == CREATE TYPES ============================================================

  def create_types
    @types.each do |type|
      create_type(type) unless Type.where(name: type['name']).first
    end
  end

  def create_type(type)
    new_type = Type.create

    Type::Translation.create(
      type_id: new_type.id,
      name: type['name'],
      locale: :fr
    )

    Type::Translation.create(
      type_id: new_type.id,
      name: type['name_en'],
      locale: :en
    )
  end

  # == CREATE TYPES EFFECTIVENESSES ============================================

  def create_types_effectivenesses
    @types.each do |type|
      I18n.locale = :en
      type_record = Type.find_by(name: type['name_en'])
      create_type_effectivenesses(type, type_record) if type_record
    end
  end

  def create_type_effectivenesses(type, type_record)
    strong_against_types = type_types_list(type['strengths'])
    weak_against_types = type_types_list(type['weaknesses'])
    very_weak_against_types = type_types_list(type['extreme_weaknesses'])
    normal_types = Type.where.not(
      id: (
        strong_against_types + weak_against_types + very_weak_against_types
      ).flatten.compact.pluck(:id)
    )

    strong_against_types.each do |t|
      create_type_effectiveness(type_record, t, :super_effective)
    end

    weak_against_types.each do |t|
      create_type_effectiveness(type_record, t, :not_very_effective)
    end

    very_weak_against_types.each do |t|
      create_type_effectiveness(type_record, t, :no_effect)
    end

    normal_types.each do |t|
      create_type_effectiveness(type_record, t, :normal)
    end
  end

  def create_type_effectiveness(attacking_type, defending_type, effectiveness)
    TypeEffectiveness.create(
      attacking_type: attacking_type,
      defending_type: defending_type,
      effectiveness: effectiveness
    )
  end

  def type_types_list(types)
    types_array = []
    types.each do |t|
      types_array << Type.find_by(name: t['name_en'])
    end
    types_array
  end

  # == CREATE MOVES ============================================================

  def create_moves
    @attacks.each do |attack|
      create_move(attack) unless Move.where(name: attack['name_en']).first
    end
  end

  def create_move(attack)
    m = Move.new
    I18n.locale = :fr
    m.type_id = Type.find_by(name: attack['type']).id if attack['type']
    m.power = attack['power'].to_f
    m.cast_time = attack['cast_time'].to_f
    m.epu = attack['epu'].to_f if attack['epu']
    m.energy_bars = attack['energy_bars'].to_i if attack['energy_bars']
    m.kind = attack['attack_category'] == 'Attaque chargée' ? :charge : :fast
    return unless m.save

    Move::Translation.create(
      move_id: m.id,
      name: attack['name'],
      locale: :fr
    )

    Move::Translation.create(
      move_id: m.id,
      name: attack['name_en'],
      locale: :en
    )
  end

  # == CREATE ITEMS ============================================================

  def create_items
    @items.each do |item|
      create_item(item) unless Item.where(name: item['name']).first
    end
  end

  def create_item(item)
    item_record = Item.create(kind: get_item_kind(item['category']))

    Item::Translation.create(
      item_id: item_record.id,
      name: item['name'],
      description: item['description'],
      locale: :fr
    )

    Item::Translation.create(
      item_id: item_record.id,
      name: item['name_en'],
      locale: :en
    )
  end

  def get_item_kind(category_name)
    case category_name
    when 'Baies'
      :berry
    when 'Capsules Techniques (CT)'
      :technical_machine
    when 'Divers'
      :misc
    when 'Incubateurs'
      :egg_incubator
    when 'Objets évolutifs'
      :evolution_item
    when 'Pass de raid'
      :raid_pass
    when 'Pokéballs'
      :pokeball
    when 'Potions et rappels'
      :potion_revive
    end
  end

  # == CREATE POKEMONS =========================================================

  def create_pokemons
    @pokemons.each do |pokemon|
      create_pokemon(pokemon) unless Pokemon.where(name: pokemon['name']).first
    end
    @pokemons.each do |pokemon|
      assign_alolan_form(pokemon) if pokemon['alolan_form']
    end
  end

  def create_pokemon(pokemon)
    I18n.locale = :fr

    p = Pokemon.create(
      nid: pokemon['num'],
      generation_id: Generation.find_by(uid: pokemon['generation'])&.id,
      candy_id: Candy.find_by(name: pokemon['candy'])&.id,
      buddy_distance: pokemon['candy_distance'],
      kind: pokemon['alolan'] ? :alolan : :normal,
      flee_rate: pokemon['flee_rate'],
      capture_rate: pokemon['capture_rate'],
      base_atk: pokemon['atk'],
      base_def: pokemon['def'],
      base_sta: pokemon['sta']
    )

    Pokemon::Translation.create(
      pokemon_id: p.id,
      name: pokemon['name'],
      description: pokemon['pokedex_entry'],
      locale: :fr
    )

    Pokemon::Translation.create(
      pokemon_id: p.id,
      name: pokemon['name_en'],
      locale: :en
    )

    p.types.clear
    p.types << Type.where(name: pokemon['type_1'])
                   .or(Type.where(name: pokemon['type_2']))

    p.moves.clear
    p.moves << pokemon_attacks_list(pokemon['attacks'])
  end

  def pokemon_attacks_list(attacks)
    attacks_array = []
    attacks.each do |a|
      I18n.locale = :en
      attacks_array << Move.find_by(name: a['name_en'])
    end
    attacks_array
  end

  def assign_alolan_form(pokemon)
    I18n.locale = :fr
    p = Pokemon.find_by(name: pokemon['name'])
    p.alolan_form_id = Pokemon.find_by(
      nid: pokemon['alolan_form'],
      kind: :alolan
    ).id

    p.save
  end

  # == EGGS ====================================================================

  def create_eggs
    @eggs.each do |egg|
      I18n.locale = :fr
      create_egg(egg) unless Egg.find_by(name: egg['name'])
    end
  end

  def create_egg(egg)
    I18n.locale = :fr
    e = Egg.new
    e.name = egg['name']
    e.description = egg['desc']
    egg['pokemons'].each do |p|
      e.pokemons << Pokemon.find_by(nid: p['num'])
    end
    e.save
  end

  # == EVOLUTIONS ==============================================================

  def create_evolutions
    @evolutions.each do |evolution|
      create_evolution(evolution)
    end
  end

  def create_evolution(evolution)
    Evolution.create(
      first_pokemon_id: Pokemon.find_by(nid: evolution['first_form']).id,
      from_pokemon_id: Pokemon.find_by(nid: evolution['before_evolution']).id,
      to_pokemon_id: Pokemon.find_by(nid: evolution['after_evolution']).id,
      required_candies_count: evolution['candies'],
      required_item_id: Item.find_by(name: evolution['item'])&.id
    )
  end

  # == RESEARCHES ==============================================================

  def create_special_researches
    @special_researches.each do |research|
      create_special_research(research) unless SpecialResearch.find_by(name: research['name'])
    end
  end

  def create_special_research(research)
    r = SpecialResearch.new
    r.name = research['name']
    r.is_active = research['is_active']
    r.desc = research['desc']
    r.save
    create_research_steps(research['steps'], SpecialResearch.find_by(name: research['name']))
  end

  def create_research_steps(steps, research)
    steps.each do |step|
      create_research_step(step, research)
    end
  end

  def create_research_step(step, research)
    s = ResearchStep.new
    s.name = step['name']
    s.step_id = step['step_id']
    s.special_research_id = research.id
    s.save
    create_research_tasks(step['tasks'], ResearchStep.find_by(name: step['name']))
    create_research_rewards(step['rewards'], ResearchStep.find_by(name: step['name']))
  end

  def create_research_tasks(tasks, step)
    tasks.each do |task|
      create_research_task(task, step)
    end
  end

  def create_research_task(task, step)
    t = ResearchTask.new
    t.name = task['name']
    t.desc = task['desc']
    t.reward_type = task['reward_type']
    t.pokemon_reward = Pokemon.find_by(name: task['pokemon_reward']).id if task['pokemon_reward']
    t.item_reward = Item.find_by(name: task['item_reward']).id if task['item_reward']
    t.xp_reward = task['xp_reward'] if task['xp_reward']
    t.research_step_id = step.id
    t.save
  end

  def create_research_rewards(rewards, step)
    rewards.each do |reward|
      create_research_reward(reward, step)
    end
  end

  def create_research_reward(reward, step)
    r = ResearchReward.new
    r.name = reward['name']
    r.reward_type = reward['reward_type']
    r.quantity = reward['quantity']
    r.research_step_id = step.id
    r.item_id = Item.find_by(name: reward['item']).id if reward['item']
    r.pokemon_id = Pokemon.find_by(name: reward['pokemon']).id if reward['pokemon']
    r.candy_id = Candy.find_by(name: reward['candy']).id if reward['candy']
    r.save
  end
end
