require 'pg'
feature 'View links' do
  scenario 'A user can see the database' do
    Bookmark.create({url: 'http://test1.com', title: 'test1'})
    Bookmark.create({url: 'http://test2.com', title: 'test2'})
    Bookmark.create({url: 'http://test3.com', title: 'test3'})

    visit('/bookmarks')

    expect(page).to have_content 'test1'
    expect(page).to have_content 'test2'
    expect(page).to have_content 'test3'
  end

  scenario 'A user can click on a link in the database' do
    Bookmark.create({url: 'http://test1.com', title: 'test1'})
      visit ('/bookmarks')
      click_link 'test1'
  end

end
