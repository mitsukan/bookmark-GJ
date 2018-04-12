require 'sinatra/base'
require './lib/bookmark'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect '/bookmarks'
  end

  post '/bookmarks/new' do
    flash[:notice] = 'You must submit a valid URL.' unless Bookmark.create(params)
    redirect '/bookmarks'
  end

  post '/bookmarks/remove' do
    flash[:notice] = 'You must submit a valid URL.' unless Bookmark.delete(params['title'])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    flash[:notice].to_s if flash[:notice]
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  get '/bookmarks/remove' do
    erb :"bookmarks/remove"
  end

  run! if app_file == $PROGRAM_NAME
end
