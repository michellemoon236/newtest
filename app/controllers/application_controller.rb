require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    @categories = User.find(2).categories.uniq
    erb :home
  end
  
  post '/categories' do 
    #raise params.inspect 
    dream = Dream.create(params["dream"])
    #binding.pry
    dream.categories << Category.create(name: params["category"]["name1"]) if !params["category"]["name1"].empty?
    dream.categories << Category.create(name: params["category"]["name2"]) if !params["category"]["name2"].empty?
    @categories = dream.categories
    #binding.pry
    erb :categories
  end

end
