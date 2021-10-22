feature 'View a page of properties owned by the user' do
  scenario 'when the user is signed in, they can visit a page with their properties on' do
    add_default_property_listings
    add_test_user_to_database
    log_user_in
    expect(page).to have_content('My Properties')
    click_link('My Properties')
    expect(page).to have_current_path('/my-properties')
    expect(page).to have_content("The Sunset Ranch")
    expect(page).to have_content("Lone Ranger Homestead")
    expect(page).to have_content("Hetty's Haberdashery")
    expect(page).to_not have_content("Startech")
    expect(page).to_not have_content("Old Ranch")
    expect(page).to_not have_content("Broken Stable")
  end
end
