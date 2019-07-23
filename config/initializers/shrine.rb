# frozen_string_literal: true

require 'shrine'
require 'shrine/storage/s3'
require 'shrine/storage/file_system'

Shrine.plugin :activerecord # or :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :determine_mime_type, analyzer: :marcel

def s3_storage
  s3_options = {
    bucket: ENV['SHRINE_S3_BUCKET'],
    access_key_id: ENV['SHRINE_S3_KEY_ID'],
    secret_access_key: ENV['SHRINE_S3_SECRET_KEY'],
    region: ENV['SHRINE_S3_REGION'],
    endpoint: ENV['SHRINE_S3_ENDPOINT']
  }

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(**s3_options)
  }
end

def test_storage
  Shrine.storages =
    {
      cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
      store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads')
    }
end

Shrine.storages = Rails.env.test? ? test_storage : s3_storage
