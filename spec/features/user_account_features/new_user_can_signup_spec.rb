feature 'New user signup: ' do
  scenario 'new user can sign up for an account' do
    create_test_user
    expect(User).to receive(:create_user).with(@test_name, @test_email, @test_password)
    sign_up_test_user
    expect(page).to have_current_path('/')
  end
end
