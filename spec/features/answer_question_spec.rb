require 'rails_helper'

feature 'visitor is able to post an answer to a question', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem
} do
#   Acceptance Criteria
#
# - I must be on the question detail page
# - I must provide a description that is at least 50 characters long
# - I must be presented with errors if I fill out the form incorrectly

  scenario 'answer a question' do

    answer_description = "There is a prison in a more ancient part of the world. A pit where men are thrown to suffer and die. But sometimes a man rises from the darkness. Sometimes, the pit sends something back."
    visit '/questions/2'

    fill_in 'Description', with: answer_description

    click_button 'Create Response'

    expect(page).to have_content(answer_description)

  end

  scenario 'answer a question' do

    answer_description = "hi"
    visit '/questions/2'

    fill_in 'Description', with: answer_description

    click_button 'Create Response'

    expect(page).to have_content("Response not added.")

  end

end
