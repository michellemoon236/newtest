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
    if !params["category"]["name"].empty?
      dream.categories << Category.create(name: params["category"]["name"])
    end
    @categories = dream.categories
    #binding.pry
    erb :categories
  end

end
