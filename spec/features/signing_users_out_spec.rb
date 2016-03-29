require "rails_helper"

RSpec.feature "Signing Users Out" do
  
  #Check to see if users already have an existing account
  before do
    @user = User.create!(email: "user@email.com", 
                         password: "password")
    visit '/'
    click_link 'Sign In'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_link 'Sign in'
  end
  
  scenario do
    visit '/'
    click_link 'Sign Out'
    
    expect(page).to have_content("You have signed out successfully")
  end
end