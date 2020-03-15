require 'rails_helper' 
RSpec.feature "Sign up users" do 
  scenario "With valid credential " do
    visit '/'
    click_link "Sign up"
    fill_in "Email", with:"maya@gmail.com"
    fill_in "Password", with:"123456"
    fill_in "Password confirmation", with:"123456" 
    click_button "Sign up"
    expect(page).to have_content("You have signed up successfully.")
  end
  
  scenario "With invalid credential " do
    visit '/'
    click_link "Sign up"
    fill_in "Email", with:""
    fill_in "Password", with:""
    fill_in "Password confirmation", with:""
    click_button "Sign up"
    #expect(page).to have_content("You have not signup successfully.")
  end
end