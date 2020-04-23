unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA5ZTIG7KMOYBGVOXY',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'zaiko-app'
    config.cache_storage = :fog
  end
end