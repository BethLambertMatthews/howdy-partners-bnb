feature 'View a page of properties owned by the user' do
  scenario 'when the user is signed in, they can visit a page with their properties on' do
    add_default_property_listings
    sign_up_test_user
    expect(page).to have_content('My Properties')
    click_link('My Properties')
    expect(page).to have_current_path('/my-properties')
  end
end
