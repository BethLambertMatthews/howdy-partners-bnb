
feature 'Request to book property button on property details page' do
  scenario 'when the user is not signed in, Log in to book button is displayed' do
    add_default_property_listings
    visit_more_details_page
    expect(page).to have_no_button('Request to book')
    click_link('login-link')
    expect(page).to have_current_path('/login')
  end

  scenario 'when the user is logged in' do
    create_and_sign_up_test_user
    add_default_property_listings
    visit_more_details_page
    expect(page).to_not have_content('Log in to book')
    expect(Property).to receive(:update_status).with('1')
    click_button('Request to book')
    expect(page).to have_current_path('/listing-details/1?requested=true')
    expect(page).to have_content('You have requested this property')
    expect(page).to have_no_button('Request to book')
  end
end
