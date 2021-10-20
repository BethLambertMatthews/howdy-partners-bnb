require 'pg'

def setup_test_database
  connection = connect
  connection.exec("TRUNCATE property_listings;")
  connection.exec("TRUNCATE users;")
end

private

def connect
  PG.connect(dbname: 'howdy_partners_test')
end
