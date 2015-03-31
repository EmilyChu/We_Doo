# CarrierWave.configure do |config|
#   config.ignore_integrity_errors = false
#   config.ignore_processing_errors = false
#   config.ignore_download_errors = false
# end

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['aws_access_key'],                        # required
    aws_secret_access_key: ENV['aws_secret_access_key'],                        # required
    region:                'us-west-2',                  # optional, defaults to 'us-east-1'
    #host:                  's3.example.com',             # optional, defaults to nil
    #endpoint:              '2015wedo.s3-website-us-west-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = '2015wedo'                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end