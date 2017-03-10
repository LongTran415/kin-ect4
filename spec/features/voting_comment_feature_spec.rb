# without stubbing
# require 'rails_helper'
#
# feature "Upvoting" do
#   scenario "Clicking upvote button" do
#     allow_any_instance_of(ApplicationController).to receive(:current_user) { User.first }
#     binding.pry
#     visit games_path
#     click_button '+1'
#     visit games_path
#     expect(page).to have_content 'vote'
#     expect(vote.upvote).to be true
#   end
# end
