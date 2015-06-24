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

    new_response_description = "Sugar plum fruitcake gummies dessert gummies jelly beans jelly beans chocolate. Cookie pastry cake marzipan cheesecake. Cake liquorice cake bonbon fruitcake caramels fruitcake soufflé macaroon. Dessert lemon drops cupcake jelly-o. Apple pie carrot cake cake biscuit toffee. Donut candy oat cake. Pudding lemon drops tart toffee. Lollipop lollipop gummies. Donut cake croissant. Marshmallow pie cake gingerbread macaroon. Brownie cheesecake jelly-o liquorice carrot cake biscuit cake oat cake chocolate. Pastry toffee pastry fruitcake macaroon danish. Brownie cake halvah halvah dragée croissant."
    response_description = 'Duo omnis libris expetenda cu. Possim numquam forensibus mel an. Usu id aeterno fastidii explicari. Illud summo sit et, dicta similique an quo. Minimum constituto reformidans no ius. Eu nihil adipisci senserit vim. Et tritani scaevola eam.'
    visit '/questions/1/responses/1/edit'

    expect(page).to have_content(response_description)

    fill_in 'Description', with: new_response_description

    click_button 'Edit'

    expect(page).to have_content(new_response_description)
    expect(page).not_to have_content(response_description)
  end

  scenario 'edits a response wrong' do

    new_response_description = "Because I said so."
    visit '/questions/1/responses/1/edit'

    fill_in 'Description', with: new_response_description

    click_button 'Edit'

    expect(page).to have_content('You did not do that correctly')

  end
end
