require 'rails_helper.rb'

#As a moviegoer, I want to be able to view all new movies, on one page, to where i can see what is out and trending.

feature "Moviegoer visits Movies page, and then visits Coming Soon page" do
   scenario "Moviegoer successfully navigates to the movies page from the home page via the navigation bar." do
       visit welcome_index_path
       expect(page).to have_content("Movies currently streaming:")
       click_link "Movies"
       expect(page).to have_content("Movies")
       expect(page).to have_content("In Theaters")
       expect(page).to have_content("OnDemand")
   end
   
   scenario "Moviegoer successfully navigates to the stories page from the movies page via the navigation bar." do
      visit movies_index_path
      expect(page).to have_content("Movies")
      expect(page).to have_content("In Theaters")
      expect(page).to have_content("OnDemand")
      click_link "Stories"
      expect(page).to have_content("Stories")
   end
end