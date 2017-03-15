
#     allow_any_instance_of(ApplicationController).to receive(:current_user) { User.first }
require 'rails_helper'

feature "Login" do
  scenario "when logging in" do
    allow_any_instance_of(ApplicationController).to receive(:current_user) { User.first }
    visit root_path
    expect(page).to have_content 'Logout'
  end
end
