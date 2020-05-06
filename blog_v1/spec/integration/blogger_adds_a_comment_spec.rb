require 'rails_helper.rb'

# As a blogger I want to be able to create a comment under an article

feature "Blogger adds an article, then adds a comment" do
        
    scenario "Blogger successfully navigates to the new articles page from the movie articles page" do
        visit articles_path
        expect(page).to have_content("Movie Articles")
        click_link "New article"
        expect(page).to have_content("New Article")
        expect(page).to have_field("Title")
        expect(page).to have_field("Text")
    end
    
    #to get to the right page, to test the comments, we have to create an article then create a comment from there
    scenario "Blogger successfully creates a new article and a new comment" do
        visit signup_path
        expect(page).to have_content("Name")
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        fill_in "Name", with: "User"
        fill_in "Email", with: "user@test.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Create User"
        
        click_link "Login"
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        fill_in "Email", with: "user@test.com"
        fill_in "Password", with: "password"
        click_button "Login"
        
        visit new_article_path
        expect(page).to have_content("New Article")
        fill_in "Title", with: "New Capybara Article"
        fill_in "Text", with: "This is a new Capybara article"
        click_button "Create Article"
        expect(page).to have_content("New Capybara Article")
        expect(page).to have_content("This is a new Capybara article")
        
        #creating a comment
        expect(page).to have_content("Comments")
        fill_in "Commenter", with: "Capybara"
        fill_in "Body", with: "This is a new Capybara comment"
        click_button "Create Comment"
        expect(page).to have_content("Capybara")
        expect(page).to have_content("This is a new Capybara comment")
    end
end