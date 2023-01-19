require 'rails_helper'

RSpec.describe 'Recipe list page', type: :feature do
  describe 'Recipe list page' do
    before(:each) do
      @user1 = User.create(name: 'Sonick Mumba', email: 's@gmail.com', password: 'qwerty')

      login_as(@user1)

      visit recipes_path

      click_on 'Add recipe'
      fill_in 'Name', with: 'Meat pie'
      fill_in 'Preparation time', with: 5
      fill_in 'Cooking time', with: 10
      fill_in 'Description', with: 'I love meat pies'
      click_on 'Adding recipe'
    end
    

    scenario 'I can see a heading Recipes List ' do
      expect(page).to have_content 'Recipes List'
    end

    scenario 'I can see a word Add recipe ' do
      expect(page).to have_content 'Add recipe'
    end

    scenario 'I can see a word Meat pie ' do
      expect(page).to have_content 'Meat pie'
    end

    scenario 'I can see a sentence I love meat pies ' do
      expect(page).to have_content 'I love meat pies'
    end
  end
end
