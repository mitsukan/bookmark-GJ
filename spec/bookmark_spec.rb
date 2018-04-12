require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks url in an array' do
      Bookmark.create({url: 'http://test1.com', title: 'test1'})

      expected_bookmarks = [['http://test1.com', 'test1']]
      expect(Bookmark.all).to eq expected_bookmarks
    end
  end


  describe '.create(params)' do
    it 'creates a new bookmark' do
      Bookmark.create({url: 'http://www.test3.com', title: 'test3'})

      expect(Bookmark.all).to eq([['http://www.test3.com', 'test3']])
    end
    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create({url:'not a real bookmark', title:'not a real title'})

      expect(Bookmark.all).not_to include 'not a real bookmark'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      Bookmark.create(url: 'http://test1.com', title: 'test1')
      Bookmark.create(url: 'http://test2.com', title: 'test2')
      Bookmark.create(url: 'http://test3.com', title: 'test3')
      Bookmark.delete(title: 'test3')

      expected_bookmarks = [
        ['http://test1.com', 'test1'],
        ['http://test2.com', 'test2'],
      ]
      expect(Bookmark.all).to eq expected_bookmarks

    end
  end

end
