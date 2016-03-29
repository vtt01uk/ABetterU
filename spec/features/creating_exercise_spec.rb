require "rails_helper"

RSpec.feature "Creating Exercise" do
  before do
    @user = User.create(email: 'user@email.com', password: 'password')
    login_as(@user)
  end
  
  scenario 'with valid inputs' do
    visit '/'
    
    click_link "Meetup Area"
    click_link "New Workout"
    
    expect(page).to have_link("Back")
    
    fill_in "Duration", with: 45
    fill_in "Workout Details", with: "WOD: Fran"
    fill_in "Activity date", with: Date.today
    
    click_button "Create Exercise"
    
    expect(page).to have_content("Exercise has been created")
    
    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@user, exercise))
  end
  
  scenario 'with invalid inputs' do
  visit '/'
    click_link 'Meetup Area'
    click_link 'New Workout'
    expect(page).to have_link('Back')
    
    fill_in "Duration", with: nil
    fill_in "Workout Details", with: ""
    fill_in "Activity date", with: ""
    click_button "Create Exercise"
    
    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("Duration can't be blank")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout can't be blank")
    expect(page).to have_content("Workout date can't be blank")
  end
end