feature 'Homepage has log out button for logged in users' do
  scenario 'when the user is logged out' do
    visit('/')
    expect(page).to have_no_button("Log Out")
  end

  scenario 'when the user is logged in' do
    create_and_sign_up_test_user
    expect(page).to have_current_path('/')
    expect(page).to have_button("Log Out")
    click_button("Log Out")
    expect(page).to have_current_path('/')
    # expect current user id to now be nil
  end
end
