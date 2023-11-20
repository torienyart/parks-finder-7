require 'rails_helper'

describe 'index' do
  it 'displays the welcome page form' do
    visit root_path

    expect(page).to have_select('state')
    expect(page).to have_button('Find Parks')
  end

  it 'displays the number of parks returned from the search' do
    visit root_path
    select('Tennessee', from: :state)
    click_on('Find Parks')

    expect(page).to have_content('Number of Parks: 16')
  end
end