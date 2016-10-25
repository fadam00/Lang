if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AKIAI36CS7QWXDKLDKOQ'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['languploads']
  end
end