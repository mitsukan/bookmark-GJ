require 'pg'
feature 'Delete links' do
  scenario 'A user can delete via entering URL' do
    Bookmark.create({url: 'http://test1.com', title: 'test1'})
    Bookmark.create({url: 'http://test2.com', title: 'test2'})
    Bookmark.create({url: 'http://test3.com', title: 'test3'})

    visit('/bookmarks')
    click_button "Remove Bookmark"
    fill_in('url', with: 'http://test3.com')
    click_button "Submit"
    expect(page).not_to have_link('test3', :href => "http://test3.com")
  end

  scenario 'A user can delete via entering title' do
    Bookmark.create({url: 'http://test1.com', title: 'test1'})
    Bookmark.create({url: 'http://test2.com', title: 'test2'})
    Bookmark.create({url: 'http://test3.com', title: 'test3'})

    visit('/bookmarks')
    click_button "Remove Bookmark"
    fill_in('title', with: 'test2')
    click_button "Submit"
    expect(page).not_to have_link('test2', :href => "http://test2.com")
  end

end
