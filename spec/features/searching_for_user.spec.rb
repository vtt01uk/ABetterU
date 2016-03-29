require "rails_helper"

RSpec.feature "Searching for User" do
  before do
    @Vladimir = User.create(first_name; "Vladimir", last_name: "Putin", email: "vladimirputin@example.com", password: "password")
    @Angela = User.create(first_name; "Angela", last_name: "Merkel", email: "angelamerkel@example.com", password: "password")
  end
  
  scenario "with existing name return all users" do
    visit '/'
    fill_in "search_name", with: "Vladimir"
    click_button "Search"
    
    expect(page).to have_content(@vladimir.full_name)
    expect(page).to have_content(@angela.full_name)
    expect(current_path).to eq("/dashboard/search")
  end
end