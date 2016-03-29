require "rails_helper"

RSpec.feature "Listing Exercise" do
  before do

    @user = User.create(first_name: "Angel", last_name: "Gabriel", email: 'angelgabriel@email.com', password: '12345678')
    @user2 = User.create(first_name: "Leonardo", last_name: "Raphael", email: 'leonardoraphael@test.com', password: '12345678')
    login_as(@user)

    @e1 = @user.exercises.create(duration_in_min: 20, workout: "WOD Fran", workout_date: Date.today )
    @e2 = @user.exercises.create(duration_in_min: 20, workout: "WOD Murphy", workout_date: Date.today)
    
    @following = Friendship.create(user: @angel, friend: @leonardo)
  end  
  
  scenario "shows user's workout for last 7 days" do
    visit '/'
    
    click_link "Meetup Area"
    
    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
 
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end
  
  scenario "shows a list of users' friends" do
    visit '/'
    
    click_link "Workouts"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@leonardo.full_name)
    expect(page).to have_link("Unfollow")
  end
end