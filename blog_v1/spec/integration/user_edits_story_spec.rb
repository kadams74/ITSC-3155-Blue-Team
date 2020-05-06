require 'rails_helper.rb'

#As a user I want to be able to edit my story

feature "User creates a story then edits it" do
    scenario "User creates a story" do
        visit stories_path
        expect(page).to have_content("Share your story about fun times at the movies!")
        expect(page).to have_content("New Story")
        click_link "New Story"
        expect(page).to have_content("New Story")
        expect(page).to have_content("Title")
        expect(page).to have_content("Image")
        expect(page).to have_content("Caption")
        fill_in "Title", with: "First User Story"
        fill_in "Caption", with: "This story does not have an image"
        click_button "Create Story"
    end
    
    scenario "User edits their story" do
        visit stories_path
        expect(page).to have_content("Share your story about fun times at the movies!")
        expect(page).to have_content("New Story")
        click_link "New Story"
        expect(page).to have_content("New Story")
        expect(page).to have_content("Title")
        expect(page).to have_content("Image")
        expect(page).to have_content("Caption")
        fill_in "Title", with: "First User Story"
        fill_in "Caption", with: "This story does not have an image"
        click_button "Create Story"
        
        expect(page).to have_content("First User Story")
        expect(page).to have_content("This story does not have an image")
        click_link "Edit"
        fill_in "Title", with: "Edited this story"
        fill_in "Caption", with: "This story still does not have an image"
        click_button "Update Story"
        
        expect(page).to have_content("Edited this story")
        expect(page).to have_content("This story still does not have an image")
    end
end