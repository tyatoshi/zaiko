unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
    :provider              => 'AWS',
    :region                => ENV['S3_REGION'], 
    :aws_access_key_id     => ENV['S3_ACCESS_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET_KEY']
    }

    config.fog_directory     =  ENV['S3_BUCKET']
    config.cache_storage = :fog
  end
end