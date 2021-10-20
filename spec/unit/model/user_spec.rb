require 'model/user'

describe User do
  describe '#create_user' do
    it 'inserts a new user into the users table' do
      insert_query = 'INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id;'
      insert_params = ['John Wayne', 'john.wayne@yeehaw.com', 'Cactus123']
      expected_id = "1"

      expect(DatabaseConnection).to receive(:query).with(insert_query, insert_params).and_return([{ 'id' => expected_id }])
      result = User.create_user(insert_params[0], insert_params[1], insert_params[2])

      expect(result).to eq expected_id
    end
  end

  describe '#log_in' do
    it 'allows an existing user to log in' do
      select_query = 'SELECT * FROM users WHERE email = $1 AND password = $2;'
      select_params = ['john.wayne@yeehaw.com', 'Cactus123']
      expected_id = "1"

      expect(DatabaseConnection).to receive(:query).with(select_query, select_params)
      result = User.log_in(select_params[0], select_params[1])

      # expect(result).to eq expected_id
    end
  end
end
