# Load the Rails application.
require_relative 'application'

# Add carrierwave support
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
Rails.application.initialize!
