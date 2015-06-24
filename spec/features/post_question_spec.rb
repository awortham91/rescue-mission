require 'rails_helper'

feature 'visitor is able to post a question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do
#   Acceptance Criteria
#
# - I must provide a title that is at least 40 characters long
# - I must provide a description that is at least 150 characters long
# - I must be presented with errors if I fill out the form incorrectly

  scenario 'adds a complete question' do

    question_title = "Ham chicken flank anim pork chop doner aute in, fatback reprehenderit in nisi boudin picanha."
    question_description = "Bacon ipsum dolor amet pork loin pork chop excepteur mollit spare ribs t-bone laboris fatback. Capicola dolor tempor proident, sausage leberkas t-bone irure. Aliqua biltong in picanha eiusmod ut eu shank tongue porchetta shoulder dolore. Dolor beef ribs anim eiusmod pariatur ground round turducken pancetta nostrud sirloin. Cillum sed venison pork loin commodo chicken culpa, cow excepteur."
    visit '/questions/new'

    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Add Question'

    expect(page).to have_content(question_title)

  end

  scenario 'adds an incomplete question' do

    question_title = "Why even bother?"
    question_description = "Because."
    visit '/questions/new'

    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Add Question'

    expect(page).to have_content('Create a New Question')

  end
end
