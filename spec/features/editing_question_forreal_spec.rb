require 'rails_helper'

feature 'visitor is able to edit a question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
} do
#   Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page

  scenario 'edits a question appropriately' do

    new_question_description = "Sugar plum fruitcake gummies dessert gummies jelly beans jelly beans chocolate. Cookie pastry cake marzipan cheesecake. Cake liquorice cake bonbon fruitcake caramels fruitcake soufflé macaroon. Dessert lemon drops cupcake jelly-o. Apple pie carrot cake cake biscuit toffee. Donut candy oat cake. Pudding lemon drops tart toffee. Lollipop lollipop gummies. Donut cake croissant. Marshmallow pie cake gingerbread macaroon. Brownie cheesecake jelly-o liquorice carrot cake biscuit cake oat cake chocolate. Pastry toffee pastry fruitcake macaroon danish. Brownie cake halvah halvah dragée croissant."
    question_description = "Hashtag Etsy Thundercats Odd Future meh keytar, heirloom DIY forage slow-carb gentrify messenger bag. Pork belly Odd Future art party, artisan Vice semiotics Bushwick taxidermy cronut small batch Brooklyn pug shabby chic. PBR Odd Future post-ironic Kickstarter, narwhal Echo Park beard crucifix stumptown cred meggings lumbersexual fingerstache. Austin asymmetrical Tumblr PBR&B. Blog McSweeney's Truffaut put a bird on it. Jean shorts heirloom Thundercats, Blue Bottle put a bird on it mumblecore ugh YOLO PBR sriracha asymmetrical. Meditation vegan Intelligentsia Thundercats."
    visit '/questions/1/edit'

    expect(page).to have_content(question_description)

    fill_in 'Description', with: new_question_description

    click_button 'Edit Question'

    expect(page).to have_content(new_question_description)
    expect(page).not_to have_content(question_description)
  end

  scenario 'edits a question wrong' do

    new_question_description = "Because I said so."
    visit '/questions/1/edit'

    fill_in 'Description', with: new_question_description

    click_button 'Edit Question'

    expect(page).to have_content('You did not do that correctly')

  end
end
