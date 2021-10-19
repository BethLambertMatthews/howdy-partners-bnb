require_relative './database/database_connection'

class Property 
attr_reader :id, :name, :description, :price

    def initialize(id, name, description, price)
        @id = id
        @name = name 
        @description = description 
        @price = price
    end

    def self.add_property(name, description, price)
        result = DatabaseConnection.query("INSERT INTO property_listings(name, description, price) VALUES($1, $2, $3) RETURNING id, name, description, price;", [name, description, price])
        Property.new(result[0]["id"], result[0]["name"], result[0]["description"], result[0]["price"])
    end

end