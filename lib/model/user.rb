require './lib/database/database_connection'

class User
  def initialize
  end

  def self.create_user(name, email, password)
    query = 'INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id;'
    params = [name, email, password]
    new_user_id = DatabaseConnection.query(query, params)
    return new_user_id[0]['id']
  end

end
