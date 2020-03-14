# frozen_string_literal: true

require 'rails_helper'
RSpec.feature 'Creating a Articles' do
  scenario 'A user creates a new article' do
    visit '/'
    click_link 'New Article'
    fill_in 'Title', with: 'creating a blog'
    fill_in 'Body', with: 'This blog contain different news'
    click_button 'Create Article'
    expect(page).to have_content('Article has been created successfully')
    expect(page.current_path).to eq(articles_path)
  end
  scenario 'A user fail to creates a new article' do
    visit '/'
    click_link 'New Article'
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    click_button 'Create Article'
    expect(page).to have_content('Article has not been created')
   expect(page).to have_content("Title can't be blank")
   expect(page).to have_content("Body can't be blank")
  end
end