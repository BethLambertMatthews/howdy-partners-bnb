require 'model/property'
require 'helpers/property_status'

describe Property do
  let(:mocked_database_response) { double :mocked_database_response }

  describe 'add_property' do
    it 'adds a property to the database' do
      insert_query = "INSERT INTO property_listings(name, description, price, status) VALUES($1, $2, $3, $4) RETURNING id, name, description, price, status;"
      insert_params = ['The Ranch', 'A good place for horses', 59.99, PropertyStatus::AVAILABLE]
      expected_id = "1"
        
      expect(DatabaseConnection).to receive(:query).with(insert_query, insert_params)
        .and_return(
          [{
              'id' => expected_id, 
              'name' => insert_params[0], 
              'description' => insert_params[1], 
              'price' => insert_params[2],
              'status' => insert_params[3]
              }])
                
      property = Property.add_property(insert_params[0], insert_params[1], insert_params[2], insert_params[3])
        
      expect(property.id).to eq(expected_id)
      expect(property.name).to eq("The Ranch")
      expect(property.description).to eq("A good place for horses")
      expect(property.price).to eq(59.99)
    end
  end

  describe 'update_status' do
    it 'updates the status of a property' do
      expected_status = "requested"
      update_query = "UPDATE property_listings SET status=$1 WHERE id=$2 RETURNING status;"
      update_params = [PropertyStatus::REQUESTED, '1']

      expect(DatabaseConnection).to receive(:query).with(update_query, update_params)
        .and_return([{'status' => expected_status}])
                
      result = Property.update_status(update_params[1])
        
      expect(result).to eq(expected_status)
    end
  end

  describe 'all_properties' do
    context 'there are no properties' do
      it 'returns an empty array' do
        select_query = "SELECT * FROM property_listings;"
        expect(DatabaseConnection).to receive(:query).with(select_query,[]).and_return []
        result = Property.all_properties
        expect(result).to eq([])
      end
    end

    context 'there are three properties' do
      it 'returns an array of all properties' do
        select_query = "SELECT * FROM property_listings;"
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

  describe '#find_by_id' do
    context 'there is no matching property' do
      it 'returns an empty array' do
        select_query = "SELECT * FROM property_listings WHERE id = $1;"
        select_param = ['1']
        expect(DatabaseConnection).to receive(:query).with(select_query,select_param).and_return []
        result = Property.find_by_id(select_param.first)
        expect(result).to eq(nil)
      end
    end

    context 'there is a matching property' do
      it 'returns an array of all properties' do
        select_query = "SELECT * FROM property_listings WHERE id = $1;"
        select_param = ['1']
        response = [{ "id" => "1", "name" => "The Rodeo", "description" => "A great place to stay", "price" => "100.00" }]
      
        expect(DatabaseConnection).to receive(:query).with(select_query, select_param).and_return(response)

        result = Property.find_by_id(select_param.first)
        
        expect(result.name).to eq("The Rodeo")
      end
    end
  end
end
