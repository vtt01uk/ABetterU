require "rails_helper"

RSpec.feature "Users signup" do
  scenario do
    visit '/'
    click_link 'Sign Up'
    fill_in "First name", with: "Vladimir"
    fill_in "Last name", with: "Putin"
    fill_in "Email", with: "username@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button 'Sign Up'
    
    expect(page).to have_content("Sign up successful")
    visit "/"
    expect(page).to have_content("Vladimir Putin")
  end
  
  scenario "with invalid credentials" do
    visit '/'
    click_link 'Sign Up'
    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    fill_in "Email", with: "username@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button 'Sign Up'
    
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end
end