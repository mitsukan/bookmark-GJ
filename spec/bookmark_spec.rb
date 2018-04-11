require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks url in an array' do
      Bookmark.create('http://test1.com', 'test1')
      Bookmark.create('http://test2.com', 'test2')
      Bookmark.create('http://test3.com', 'test3')

      expected_bookmarks = [
        ['http://test1.com', 'test1'],
        ['http://test2.com', 'test2'],
        ['http://test3.com', 'test3'],
      ]
      expect(Bookmark.all).to eq expected_bookmarks
    end
  end


  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create('http://www.test3.com', 'test3')

      expect(Bookmark.all).to eq([['http://www.test3.com', 'test3']])
    end
    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create('not a real bookmark', 'not a real title')

      expect(Bookmark.all).not_to include 'not a real bookmark'
    end
  end
end
