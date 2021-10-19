require './lib/database/database_connection'

class User
  def initialize
  end

  def self.create_user(name, email, password)
    query = 'INSERT INTO users (name, email, password) VALUES ($1, $2, $3);'
    params = [name, email, password]
    DatabaseConnection.query(query, params)
  end

end
