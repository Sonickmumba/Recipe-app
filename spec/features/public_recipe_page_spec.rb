require 'rails_helper'

RSpec.describe 'Recipe list page', type: :feature do
  describe 'Recipe list page' do
    before(:each) do
      @user1 = User.create(name: 'Sonick Mumba', email: 's@gmail.com', password: 'qwerty')

      login_as(@user1)

      visit public_recipes_path
    end

    scenario 'I can see a heading Public Recipes ' do
      expect(page).to have_content 'Public Recipes'
    end
  end
end
