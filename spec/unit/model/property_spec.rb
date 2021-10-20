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
end
