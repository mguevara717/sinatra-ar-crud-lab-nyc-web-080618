
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/posts/new' do
    @post = Post.all
    erb :'new'
  end

  post '/posts' do
    @post = Post.create (
      name: params[:name]
      content: params[:content]
    )
    redirect '/cows'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'show'
  end


  get '/posts/:id/edit' do
    erb :'edit'
  end

  get '/posts/:id/delete' do
    Post.find(params[:id]).destroy
    erb :'delete'
    redirect '/posts'
  end







end#END OF CLASS APPLICATION CONTROLLER
