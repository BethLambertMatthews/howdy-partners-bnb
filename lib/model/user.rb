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

  def self.log_in(email, password)
    query = 'SELECT * FROM users WHERE email = $1 AND password = $2;'
    params = [email, password]
    result = DatabaseConnection.query(query, params)

    result.num_tuples.zero? ? "This user does not exist" : result[0]['id']    
  end

  def self.log_out
    logged_out_id = nil
    return logged_out_id
  end

end
