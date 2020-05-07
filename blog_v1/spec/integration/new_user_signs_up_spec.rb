require 'rails_helper.rb'

# As a user I want to be able to create an account

feature "New user creates an account" do
    scenario "New user signs up" do
        visit signup_path
        expect(page).to have_content("Name")
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        fill_in "Name", with: "User"
        fill_in "Email", with: "user@test.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Create User"
    end
    
    scenario "User signs in" do
        visit login_path
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        fill_in "Email", with: "user@test.com"
        fill_in "Password", with: "password"
        click_button "Login"
    end
    
end