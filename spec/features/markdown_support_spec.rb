require 'rails_helper'

feature 'vistor should be able to use markdown', %Q{
  As a user
  I want to write my questions and answers with markdown
  So I can easily format my questions and answers
} do
#   Acceptance Criteria
#
# - I can write my questions and answers using markdown syntax
# - Questions and answers, when shown, should be the HTML rendered from the
#   markdown

  scenario 'user uses markdown tags' do

    question_title = "Does my markdown thingy work blah blahb lahb labhlabhadsfjhalkjdfhad"
    question_description = "How many chickens crossed the road to get to the other side on a sunday? ```ruby require 'pry' ``` b;ajakashdkfjhkjashdkjfhkjhasdkjfhkjhaksjdhfkjhakjsdhfkjhkjashdfkjhkjahsdfkjhkjahsdkfjhkjahsdkjfhkjahsdkjfhkjashdkfjhkjashdkfjhkjahsdkjfhkjahsdkjfhkjahsdkfjhsdlkjfa;lskdfjal;sdk "
    visit '/questions/new'
    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Add Question'
    click_link "Does my markdown thingy work blah blahb lahb labhlabhadsfjhalkjdfhad"
    expect(page).not_to have_content("```ruby")
  end
end
