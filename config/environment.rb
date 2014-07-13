# Load settings.yml
APP_CONFIG = YAML.load_file('config/settings.yml')[Rails.env] rescue {}

# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
