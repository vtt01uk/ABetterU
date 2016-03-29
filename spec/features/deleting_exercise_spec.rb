require "rails_helper"

RSpec.feature "Deleting Exercise" do
  before do
    @user = User.create(email: "user@example.com", password: "password")
    
    @user_exer = @user.exercises.create!(duration_in_min: 55, workout: "Cardio special". workout_date: Date.today)
    
    login_as(@user)
  end
  
  scenario do
    visit '/'
    click_link "Meetup Area"
    link = "//a[contains(@href, '/users/#{@user.id}/exercises/#{@user_exer.id}') and .//text()='Destroy']"
    find(:xpath, link).click
    
    expect(page).to have_content("Exercise has been deleted")
  end
end