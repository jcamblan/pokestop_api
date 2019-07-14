# frozen_string_literal: true

class PogoAssetsUtils
  require 'net/http'

  def self.updated_datas(locales = [])
    hash = {}
    locales.each { |l| hash[l] = parse_file_for(l) }
    hash
  end

  def self.parse_file_for(locale)
    filename = case locale
               when :en
                 'merged%20%236.txt'
               when :fr
                 'merged%20%2310.txt'
               end
    format_data(filename)
  end

  def self.format_data(filename)
    url = URI::HTTPS.build(
      host: 'raw.githubusercontent.com',
      path: "/ZeChrales/PogoAssets/master/static_assets/txt/#{filename}"
    )
    file = Net::HTTP.get(url)
    lines = file.split(/\n/)
    counter = 0
    buffer = ''
    dictionary = {}

    while counter < lines.length
      current_line = lines[counter]

      if current_line.match(/^\s+\[\d+\]$/)
        if buffer.length.positive?
          key = buffer.match(/^\s+string Key = ".*"$/)[0]
                      .match(/\s+string Key = "(.*)"/)[1]
          start_index = buffer.index('string Translation = "') + 22
          end_index = buffer.rindex('') - 2
          dictionary[key] = buffer[start_index, end_index].strip.gsub(/\"/, '')
        end
        buffer = current_line + "\n"
      elsif buffer.length.positive?
        buffer += (current_line + "\n")
      end

      counter += 1
    end

    dictionary
  end
end
