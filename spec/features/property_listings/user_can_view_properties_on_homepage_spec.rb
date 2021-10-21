feature 'user can view all properties' do
  scenario 'when they visit the homepage' do
    add_default_property_listings
    visit ('/')
    expect(page).to have_content("The Sunset Ranch")
    expect(page).to have_content("£50.00")
    expect(page).to have_content("Lone Ranger Homestead")
    expect(page).to have_content("£60.10")
    expect(page).to have_content("Hetty's Haberdashery")
    expect(page).to have_content("£107.99")
  end
end
