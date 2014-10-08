require 'rails_helper'

describe 'posts' do
  context 'no posts have been added' do
    it 'should display a prompt to add posts' do
      visit '/posts'
      expect(page).to have_content 'Posts pending'
      expect(page).to have_link 'Add post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(name: 'My cat')
    end

    it 'should display them' do
      visit '/posts'
      expect(page).to have_content "A photo of my cat"
      expect(page).not_to have_content "Posts pending"
    end
  end


end
