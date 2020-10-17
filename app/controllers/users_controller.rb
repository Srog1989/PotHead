class UseRsController < ApplicationController
  
  get '/signup' do
    if logged_in?
        redirect to '/plants'
    else 
        erb :'users/signup'
    end 
end 

post '/signup' do
   
    if params[:username] == "" || params[:password] == ""
        redirect "/signup"
    else
        user =User.create(:username => params[:username], :password => params[:password])
        if user.save
            session[:user_id] = user.id
            redirect "/plants"
        else
            redirect "/signup"
        end
    end
end


get "/login" do
    if logged_in?
        redirect to '/plants'
    else
    erb :"users/login"
    end
end

post "/login" do 
    # binding.pry
    if params[:username] == "" || params[:password] == "" 
        redirect "/login"
    else 
        user = User.find_by(username: params[:username])
        if user.save
            session[:user_id] = user.id
            redirect "/plants"
        else
            redirect "/login"
        end
    end
end 

get '/logout' do
    session.clear
    erb :'/users/login'
end
  
  
  
  
  
  
  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end
  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end
  # POST: /users
  post "/users" do
    redirect "/users"
  end
  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end
  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end
  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end
  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end