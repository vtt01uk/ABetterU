require "rails_helper"

RSpec.feature  "Searching for User" do
  before do
    @Vladimir = User.create(first_name; "Vladimir", last_name: "Putin", email: "vladimirputin@example.com", password: "12345678")
    @Angela = User.create(first_name; "Angela", last_name: "Putin", email: "angelaputin@example.com", password: "12345678")
  end
  
  scenario 'with existing names returns all those users' do
    visit '/'
    
    fill_in 'search_name', with: 'Putin'
    click_button 'Search'
    
    expect(page).to have_content(@vladimir.full_name)
    expect(page).to have_content(@angela.full_name)
    expect(current_path).to eq('/dashboard/search')