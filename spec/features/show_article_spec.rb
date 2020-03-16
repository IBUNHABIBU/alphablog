require 'rails_helper'
RSpec.feature "Listing Articles" do 
 before do 
   @john = User.create(email:"john@gmail.com",password:"123456")
   @gile = User.create(email:"gile@gmail.com",password:"123456")
  @article = Article.create(title:"Article heading 1",body:"Body of first article", user: @john)
 end
 scenario "A user show an article" do 
  visit '/'
  click_link @article.title
  expect(page).to have_content(@article.title)
  expect(page).to have_content(@article.body)
  expect(current_path).to eq(article_path(@article))
 end
 
 scenario " To non-signed in user hide Edit and delete button " do 
  visit '/'
  click_link @article.title
  expect(page).to have_content(@article.title)
  expect(page).to have_content(@article.body)
  expect(current_path).to eq(article_path(@article))
  expect(page).not_to have_link('Edit Article')
  expect(page).not_to have_link('Delete Article')
 end
 scenario " To non-owner hide Edit and delete button " do 
  login_as(@gile)
  visit '/'
  click_link @article.title
  expect(page).to have_content(@article.title)
  expect(page).to have_content(@article.body)
  expect(current_path).to eq(article_path(@article))
  expect(page).not_to have_link('Edit Article')
  expect(page).not_to have_link('Delete Article')
 end
 end