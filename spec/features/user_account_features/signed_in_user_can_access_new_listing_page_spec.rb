feature 'Homepage has link to new listing page for logged in users' do
  scenario 'when the user is logged out' do
    visit('/')
    expect(page.has_link?("new-property-link")).to eq false 
  end

  scenario 'when the user is logged in' do
    create_and_sign_up_test_user
    expect(page).to have_current_path('/')
    expect(page.has_link?("new-property-link")).to eq true 
    click_link("new-property-link")
    expect(page).to have_current_path('/add-new-property')
  end
end
