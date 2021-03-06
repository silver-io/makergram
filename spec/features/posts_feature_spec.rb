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
      Post.create(name: 'A photo of my cat')
    end

    it 'should display them' do
      visit '/posts'
      expect(page).to have_content "A photo of my cat"
      expect(page).not_to have_content "Posts pending"
    end
  end

  context 'when adding posts' do
    it 'prompts the user to fill in a form, then displays the post' do
      visit '/posts/new'
      # click_link 'Add post'
      # puts page.html
      fill_in 'post[name]', with: 'Hello!'
      click_button 'Create Post'
      expect(page).to have_content 'Hello!'
      # expect(page).to have_css('img')
      expect(current_path).to eq '/posts'

    end


  end



end
