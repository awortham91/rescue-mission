require 'rails_helper'

feature 'visitor is able to select the best answer', %Q{
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
    accepted_answer = "This answer is the best ajsdhfaklsdjhflaksjdhfaksjdhfaksjdhfaksjdhfaksjdhflaksjdfhlaksdjfhaksdjfhkdjfhalksdjfhalksdjfh"
    other_answer = "ajsdhfaklsdjhflaksjdhfaksjdhfaksjdhfaksjdhfaksjdhflaksjdfhlaksdjfhaksdjfhkdjfhalksdjfhalksdjfh"

    visit '/questions/1'
    fill_in 'Description', with: accepted_answer
    click_button 'Create Response'


    fill_in 'Description', with: other_answer
    click_button 'Create Response'


    page.body.index(other_answer).should < page.body.index(accepted_answer)

    within all(".response")[1] do
      click_on("Accept Answer")
    end

    expect(page).to have_content('Answer Accepted')
    expect(page).to have_content('Unaccept Answer')
    page.body.index(accepted_answer).should < page.body.index(other_answer)

  end
end
