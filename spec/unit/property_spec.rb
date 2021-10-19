require 'property'

describe Property do
    # describe 'initialize' do
    #     it 'initializes a new property' do
    #         expect(Property.new('id', 'name', 'description', 'price')).to eq('New Property')
    #     end
    # end

    describe 'add_property' do
        it 'adds a property to the database' do
            property = Property.add_property('The Ranch', 'A good place for horses', 59.99)
            persisted_data = PG.connect(dbname: "howdy_partners_test").query("SELECT * FROM property_listings WHERE id = #{property.id}")
            expect(property.id).to eq(persisted_data.first["id"])
            expect(property.name).to eq("The Ranch")
            expect(property.description).to eq("A good place for horses")
            expect(property.price).to eq("59.99")
        end
    end
end