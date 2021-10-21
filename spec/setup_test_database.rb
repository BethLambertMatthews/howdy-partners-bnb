require 'pg'

def setup_test_database
  connection = connect_to_test_db
  connection.exec("TRUNCATE property_listings;")
  connection.exec("TRUNCATE users;")
end

def add_default_property_listings
  connection = connect_to_test_db
  connection.exec("INSERT INTO property_listings(name, description, price) VALUES('The Sunset Ranch', 'Description', '50')")
  connection.exec("INSERT INTO property_listings(name, description, price) VALUES('Lone Ranger Homestead', 'Description', '60.10')")
  connection.exec("INSERT INTO property_listings(name, description, price) VALUES('Hetty''s Haberdashery', 'Description', '107.99')")
  
end

private

def connect_to_test_db
  PG.connect(dbname: 'howdy_partners_test')
end
