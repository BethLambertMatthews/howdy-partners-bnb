require_relative '../database/database_connection'
require_relative '../helpers/property_status'

class Property 
  include PropertyStatus
  attr_reader :id, :name, :description, :price

  def initialize(id, name, description, price, status = PropertyStatus::AVAILABLE)
    @id = id
    @name = name 
    @description = description 
    @price = price
    @status = status
  end

  def self.add_property(name, description, price)
    query = "INSERT INTO property_listings(name, description, price) VALUES($1, $2, $3)" +
             " RETURNING id, name, description, price;"
    params = [name, description, price]
    result = DatabaseConnection.query(query, params)
    Property.new(result[0]["id"], result[0]["name"], result[0]["description"], 
result[0]["price"])
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
      Property.new(property["id"], property["name"], property["description"], 
        property["price"])
    end
  end

  def self.find_by_id(id)
    query =  "SELECT * FROM property_listings WHERE id = $1;"
    params = [id]
    result = DatabaseConnection.query(query, params)
    property = result.map do |property|
      Property.new(property["id"], property["name"], property["description"], property["price"])
    end
    property.empty? ? nil : property[0]
  end


end
