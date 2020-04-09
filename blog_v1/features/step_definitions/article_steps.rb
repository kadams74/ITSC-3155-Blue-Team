Given("I am on the homepage") do
    visit root_path
end

When("I click on the {string} link") do |string|
click_link string
end

Then("I should be on the {string} page") do |string|
expect(page).to have_content(string)
end


When("I should see the {string} field") do |string|
expect(page).to have_field(string)
end