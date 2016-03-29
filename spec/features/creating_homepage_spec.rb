require "rails_helper"

RSpec.feature "Creating Home Page" do
  #Scenario for RSpec to follow through...
  scenario do
    visit '/'
    expect(page).to have_link('Meetup Area')
    expect(page).to have_link('Home')
  end
end