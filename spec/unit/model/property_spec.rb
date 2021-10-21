require 'model/property'

describe Property do
  describe 'add_property' do
    it 'adds a property to the database' do
      insert_query = "INSERT INTO property_listings(name, description, price) VALUES($1, $2, $3) RETURNING id, name, description, price;"
      insert_params = ['The Ranch', 'A good place for horses', 59.99]
      expected_id = "1"
        
      expect(DatabaseConnection).to receive(:query).with(insert_query, insert_params)
        .and_return(
          [{
              'id' => expected_id, 
              'name' => insert_params[0], 
              'description' => insert_params[1], 
              'price' => insert_params[2]
              }])
                
      property = Property.add_property(insert_params[0], insert_params[1], insert_params[2])
        
      expect(property.id).to eq(expected_id)
      expect(property.name).to eq("The Ranch")
      expect(property.description).to eq("A good place for horses")
      expect(property.price).to eq(59.99)
    end
  end
  describe 'all_properties' do
    context 'there are no properties' do
      it 'returns an empty array' do
        select_query = "SELECT * FROM property_listings"
        expect(DatabaseConnection).to receive(:query).with(select_query,[]).and_return []
        result = Property.all_properties
        expect(result).to eq([])
      end
    end

    context 'there are three properties' do
      it 'returns an array of all properties' do
        select_query = "SELECT * FROM property_listings"
        response = [
          { "id" => "1", "name" => "The Rodeo", "description" => "A great place to stay", "price" => "100.00" },
          { "id" => "2", "name" => "The Homestead", "description" => "A not so place to stay", "price" => "80.00" },
          { "id" => "3", "name" => "The Barn", "description" => "A terrible place to stay", "price" => "60.00" }
        ]
        expect(DatabaseConnection).to receive(:query).with(select_query,[]).and_return(response)
        result = Property.all_properties
        expect(result[0].name).to eq("The Rodeo")
        expect(result[1].name).to eq("The Homestead")
        expect(result[2].name).to eq("The Barn")
      end
    end
  end
end
