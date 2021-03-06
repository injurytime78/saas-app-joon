# config/initializers/imgkit.rb
IMGKit.configure do |config|
  ##config.wkhtmltoimage = '/path/to/wkhtmltoimage'
  config.wkhtmltoimage = '/usr/bin/wkhtmltoimage'
  config.wkhtmltoimage = Rails.root.join('bin', 'wkhtmltoimage-amd64').to_s if ENV['RACK_ENV'] == 'production'
  config.default_options = {
    :quality => 100
  }
  config.default_format = :png
end