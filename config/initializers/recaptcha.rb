Recaptcha.configure do |config|
  config.public_key  = ENV['CAPTCHA_PUK']
  config.private_key = ENV['CAPTCHA_PRK']
end