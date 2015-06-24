require 'rails_helper'

feature 'visitor sees most recent questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first

  scenario 'list most recent questions' do

    question_title = "How many chickens crossed the road to get to the other side on a sunday?"
    question_title_2 = "Can the world fall flat on its face if the world is rounder than the earth?"
    visit '/questions'

    page.body.index(question_title).should < page.body.index(question_title_2)
  end
end
