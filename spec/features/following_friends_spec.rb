require "rails_helper"

RSpec.feature "Following Friends" do
  before do
    @user = User.create(first_name: "John", last_name: "Doe", email: "johndoe@email.com", password: "12345678")
    @user2 = User.create(first_name: "Jane", last_name: "Doe", email: "janedoe@email.com", password: "12345678")
    
    login as(@john)
  end

  scenario "if signed in succeeds" do
    visit '/'
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@jane.full_name)
    expect(page).not_to have_link("Follow", ahref => "/friendships?friend_id=#{@john.id}")
    
    link = "a[href='/friendships?friend_id=#{@jane.id}']"
    find(link).click
    
    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id=#{@jane.id}")
  end
end
