require 'rails_helper'

describe 'posts page' do
  it 'has no posts' do
    visit '/posts'
    expect(page).to have_content 'Posts pending'
  end

end
