require 'pg'

class Bookmark
  def self.all
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                 end
    result = connection.exec('SELECT * FROM bookmarks')
    p result.map { |bookmark| [bookmark['url'], bookmark['title']] }
  end


  def self.create(params)
    return false unless is_url?(params[:url])
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                end
    connection.exec("INSERT INTO BOOKMARKS(url, title) VALUES('#{params[:url]}', '#{params[:title]}')")
  end

  def self.delete(params)
    connection = if ENV['RACK_ENV'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
                end
    connection.exec("DELETE FROM bookmarks WHERE url='#{params[:url]}' OR title='#{params[:title]}';")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI.regexp(%w[http https])}\z/
  end
end
