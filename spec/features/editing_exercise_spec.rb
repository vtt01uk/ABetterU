require "rails_helper"

RSpec.feature "Editing Exercises" do
  before do
    @user = User.create(email: 'user@email.com', password: 'password')
    @user_exer = @user.exercises.create!(duration_in_min: 50, 
                                         workout: "Cardio activity", 
                                         workout_date: Date.today)
    login_as(@user)
  end
  
  scenario 'with valid inputs succeeds' do
    visit '/'
    click_link 'Meetup Area'
    link = "a[hef='/users/#{@user.id}/exercises/#{@user_exer.id}/edit']"
    find(link).click
    fill_in 'Duration', with: 50
    click_button 'Update Exercise'
  
    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(50)
    expect(page).not_to have_content(45)
  end
end