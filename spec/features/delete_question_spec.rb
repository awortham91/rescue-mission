require 'rails_helper'

feature 'visitor is able to delete a question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions
} do
#   Acceptance Criteria
#
# - I must be able delete a question from the question edit page
# - I must be able delete a question from the question details page
# - All answers associated with the question must also be deleted

  scenario 'deletes a question appropriately' do

    question_title = "How many chickens crossed the road to get to the other side on a sunday?"
    visit '/questions/1'
    expect(page).to have_content(question_title)

    click_link 'Delete'

    expect(page).not_to have_content(question_title)
  end
end
