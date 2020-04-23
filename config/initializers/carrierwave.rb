unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA5ZTIG7KMIZTL3CFO',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'zaiko-app'
    config.cache_storage = :fog
  end
end