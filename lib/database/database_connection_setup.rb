require 'dotenv/load'
require './lib/database/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(ENV['TEST_DB'])
else
  # :nocov:
  DatabaseConnection.setup(ENV['PROD_DB'])
  # :nocov:
end
