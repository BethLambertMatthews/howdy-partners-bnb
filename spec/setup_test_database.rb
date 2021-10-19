require 'pg'

def setup_test_database
  connection.exec("TRUNCATE property_listings; TRUNCATE users;")
end

private

def connection
  PG.connect(dbname: 'howdy_partners_test')
end