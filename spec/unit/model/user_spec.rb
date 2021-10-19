require 'model/user'

describe User do
  describe '#create_user' do
    it 'inserts a new user into the users table' do
      insert_query = 'INSERT INTO users (name, email, password) VALUES ($1, $2, $3);'
      insert_params = ['John Wayne', 'john.wayne@yeehaw.com', 'Cactus123']
      expect(DatabaseConnection).to receive(:query).with(insert_query, insert_params)
      User.create_user(insert_params[0], insert_params[1], insert_params[2])
    end
  end
end
