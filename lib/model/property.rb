require_relative '../database/database_connection'
require_relative '../helpers/property_status'

class Property 
  include PropertyStatus
  attr_reader :id, :name, :description, :price, :status, :owner_id

  def initialize(id, name, description, price, status = PropertyStatus::AVAILABLE, owner_id)
    @id = id
    @name = name 
    @description = description 
    @price = price
    @status = status
    @owner_id = owner_id
  end

  def self.add_property(name, description, price, status = PropertyStatus::AVAILABLE, owner_id)
    query = "INSERT INTO property_listings(name, description, price, status, owner_id) VALUES($1, $2, $3, $4, $5)" +
             " RETURNING id, name, description, price, status, owner_id;"
    params = [name, description, price, status, owner_id]
    result = DatabaseConnection.query(query, params)
    Property.new(result[0]["id"], result[0]["name"], result[0]["description"], result[0]["price"], result[0]['status'], result[0]['owner_id'])
  end

  def self.update_status(id)
    query = "UPDATE property_listings SET status=$1 WHERE id=$2 RETURNING status;"
    params = [PropertyStatus::REQUESTED, id]
    result = DatabaseConnection.query(query, params)
    return result[0]['status']
  end

  def self.all_properties
    query =  "SELECT * FROM property_listings;"
    result = DatabaseConnection.query(query, [])
    result.map do |property|
      Property.new(property["id"], property["name"], property["description"], property["price"], property['status'], property['owner_id'])
    end
  end

  def self.find_by_id(id)
    query =  "SELECT * FROM property_listings WHERE id = $1;"
    params = [id]
    result = DatabaseConnection.query(query, params)
    property = result.map do |property|
      Property.new(property["id"], property["name"], property["description"], property["price"], property['status'], property['owner_id'])
    end
    property.empty? ? nil : property[0]
  end

  def self.find_properties_by_owner_id(owner_id)
    query =  "SELECT * FROM property_listings WHERE owner_id = $1;"
    params = [owner_id]
    result = DatabaseConnection.query(query, params)
    property = result.map do |property|
      Property.new(property["id"], property["name"], property["description"], property["price"], property['status'], property['owner_id'])
    end
    return property
  end

end
