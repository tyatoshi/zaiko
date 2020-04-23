unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIA5ZTIG7KMLR2U4IEO',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'zaiko-app'
    config.cache_storage = :fog
  end
end

ENV[hoge]