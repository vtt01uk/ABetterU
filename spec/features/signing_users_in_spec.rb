require "rails_helper"

RSpec.feature "Signing Users In" do
  #Check to see if users already have an existing account
  before do
    @user = User.create!(email: "user@email.com", 
                         password: "password")
  end
  
  scenario "with valid credentials" do
    visit '/'
    click_link 'Sign In'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button 'Sign in'
    
    expect(page).to have_content("You have signed in successfully")
    expect(page).to have_content("Signed in as #{@user.email}")
  end
end