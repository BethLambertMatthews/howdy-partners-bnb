feature 'Add Property' do
  scenario 'should create and add property to the property listing database' do
    visit("/add-new-property")
    page.fill_in("name", with: "The Rodeo")
    page.fill_in("description", with: "Have all the fun at The Rodeo")
    page.fill_in("price", with: "24.99")
    page.click_button("Submit")
    
  end
end