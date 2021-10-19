require './lib/database/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('howdy_partners_test')
else
  # :nocov:
  DatabaseConnection.setup('howdy_partners')
  # :nocov:
end
