feature 'Add Property' do
  scenario 'should create and add property to the property listing database' do
    visit("/add-new-property")
    expect(page).to have_content("Add a new property listing")
    expect(page).to have_content("Name of property:")
    page.fill_in("name", with: "The Rodeo")
    expect(page).to have_content("Property price per night:")
    page.fill_in("price", with: "24.99")
    expect(page).to have_content("Description of property:")
    page.fill_in("description", with: "Have all the fun at The Rodeo")
    page.click_button("Submit")
  end
end
