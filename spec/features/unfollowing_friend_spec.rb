require "rails_helper"

Rspec.feature "Unfollowing Friend" do
  before do
    @user1 = User.create(first_name: "John", last_name: "Doe", email: "johndoe@email.com", password: "12345678")
    @user2 = User.create(first_name: "Jane", last_name: "Smith", email: "janesmith@email.com", password: "password")
    
    login_as(@user1)
    
    @following = Friendship.create(user: @user1, friend: @user2)
  end
  
  scenario do
    visit '/'
    click_link "Workouts"
    link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click
    
    expect(page).to have_content(@user2.full_name + " unfollowed")
  end
end
