require 'rails_helper'

feature 'visitor is able to delete a question', %Q{
  As a user
  I want to mark an answer as the best answer
  So that others can quickly find the answer
} do
#   Acceptance Criteria
#
# - I must be on the question detail page
# - I must be able mark an answer as the best
# - I must see the "best" answer above all other answers in the answer list

  scenario 'user chooses best answer' do

    question_title = "How many chickens crossed the road to get to the other side on a sunday?"
    visit '/questions/1'
    expect(page).to have_content(question_title)

    click_link 'Delete'

    expect(page).not_to have_content(question_title)
  end
end
