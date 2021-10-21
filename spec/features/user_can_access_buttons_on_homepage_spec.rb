feature 'user can access buttons on homepage' do
    scenario 'not-logged-in user can click log in button on homepage' do
        visit('/')
        expect(page).to have_button("Log In")
        click_link("Log In")
        expect(page).to have_current_path('/login')
    end

    scenario 'not-logged-in user can click sign up button on homepage' do
        visit('/')
        expect(page).to have_button("Sign Up")
        click_link("Sign Up")
        expect(page).to have_current_path('/sign-up')
    end
end