require 'rails_helper'

feature 'visitor can access question details', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  scenario 'link to and display question details' do

    visit '/questions'

    click_link "How many chickens crossed the road to get to the other side on a sunday?"

    expect(page).to have_content("Hashtag Etsy Thundercats Odd Future meh keytar, heirloom DIY forage")


  end
end
