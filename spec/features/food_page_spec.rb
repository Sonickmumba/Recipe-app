require 'rails_helper'

RSpec.describe 'food index page', type: :feature do
  describe 'food index page' do
    before(:each) do
      @user1 = User.create(name: 'Sonick Mumba', email: 's@gmail.com', password: 'qwerty')

      login_as(@user1)

      visit foods_path

      click_on 'Add food'
      fill_in 'Name', with: 'Meat'
      fill_in 'Measurement unit', with: 'grams'
      fill_in 'Price', with: 10
      fill_in 'Quantity', with: 12
      click_on 'Adding Food'
    end

    scenario 'I can see a button Add food ' do
      expect(page).to have_content 'Add food'
      expect(page).to have_content 'Action'
    end

    scenario 'I can see a word Action ' do
      expect(page).to have_content 'Action'
    end

    scenario 'I can see a word Meat ' do
      expect(page).to have_content 'Meat'
    end

    scenario 'I can see a word grams ' do
      expect(page).to have_content 'grams'
    end
  end
end
