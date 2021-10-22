require 'pg'

def setup_test_database
  connection = connect_to_test_db
  connection.exec("TRUNCATE property_listings;")
  connection.exec("TRUNCATE users;")
end

def add_default_property_listings
  connection = connect_to_test_db
  connection.exec("INSERT INTO property_listings VALUES(1, 'The Sunset Ranch', 'Description', '50', 'available', 1)")
  connection.exec("INSERT INTO property_listings VALUES(2, 'Lone Ranger Homestead', 'Description', '60.10', 'available', 1)")
  connection.exec("INSERT INTO property_listings VALUES(3, 'Hetty''s Haberdashery', 'Description', '107.99', 'available', 1)")
  connection.exec("INSERT INTO property_listings VALUES(4, 'Startech', 'Description', '42.99', 'available', 2)")
  connection.exec("INSERT INTO property_listings VALUES(5, 'Old Ranch', 'Description', '107.99', 'available', 3)")
  connection.exec("INSERT INTO property_listings VALUES(6, 'Broken Stable', 'Description', '999.99', 'available', 4)")
end

def add_test_user_to_database
  connection = connect_to_test_db
  connection.exec("INSERT INTO users VALUES (1, 'John Wayne', 'john.wayne@yeehaw.com', 'Cactus123') RETURNING id;")
end

private

def connect_to_test_db
  PG.connect(dbname: ENV['TEST_DB'])
end
