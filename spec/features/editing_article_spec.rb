require 'rails_helper'
RSpec.feature "Editing article" do
  before do 
    john = User.create(email:"john@gmail.com",password:"123456")
    login_as(john)
    @article = Article.create(title:"first article",body:"content for the first article",user:john)
  end
  scenario 'User edit an article' do 
    visit '/'
    click_link @article.title 
    click_link 'Edit Article'
    fill_in "Title", with:"Updated Title"
    fill_in "Body", with:"Updated body"
    click_button "Update Article"
    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
  
  scenario 'User fail to update an article' do 
    visit '/'
    click_link @article.title 
    click_link 'Edit Article'
    fill_in "Title", with:""
    fill_in "Body", with:"Updated body"
    click_button "Update Article"
    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end