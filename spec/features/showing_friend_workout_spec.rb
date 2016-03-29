require "rails_helper"
  RSpec.feature "Showing Friend Workout" do
  before do
    
    @user1 = User.create(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "12345678")
    @user2 = User.create(first_name: "Jane", last_name: "Smith", email: "janesmith@example.com", password: "12345678")
    
    @e1 = @john.exercises.create(duration_in_min: 45, workout: "Bench Press",
    workout_date: Date.today)
    @e2 = @jane.exercises.create(duration_in_min: 50, workout: "Spin class",
    workout_date: Date.today)
    
    login_as(@john)
    @following = Friendship.create(user: @john, friend: @jane)
  end
  
  scenario "shows friend's workout for last 7 days" do
    visit "/"
    click_link "Workouts"
    click_link @jane.full_name
    expect(page).to have_content(@jane.full_name + "'s Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")
  end
end