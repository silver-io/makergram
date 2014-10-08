require 'rails_helper'

describe 'posts page' do
  context 'no posts have been added' do
    it 'should display a prompt to add posts' do
      visit '/posts'
      expect(page).to have_content 'Posts pending'
      expect(page).to have_link 'Add post'
    end
  end
end
