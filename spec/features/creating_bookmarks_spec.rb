feature 'Adding a new bookmark' do

  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://test4.com')
    fill_in('title', with:'test4')
    click_button('Submit')
    expect(page).to have_content 'test4'
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')

    expect(page).to have_content 'You must submit a valid URL.'
  end

end
