require "rails_helper"

RSpec.feature  "Listing Members" do
  before do
    @Vladimir = User.create(first_name; "Vladimir", last_name: "Putin", email: "vladimirputin@example.com", password: "password")
    @Angela = User.create(first_name; "Angela", last_name: "Merkel", email: "angelamerkel@example.com", password: "password")
  end
  
  scenario "shows a list of registered members" do
    visit '/'
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@vladimir.full_name)
    expect(page).to have_content(@angela.full_name)
  end
end
    