class UseRsController < ApplicationController
  
  get '/signup' do
    if logged_in?
        redirect to '/plants'
    else 
        erb :'users/signup.html'
    end 
end 

post '/signup' do
   
    if params[:username] == "" || params[:password] == ""
        redirect "/signup"
    else
        if user =User.new(:username => params[:username], :password => params[:password])
        user.save
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
    erb :"users/login.html"
    end
end

post "/login" do 
    # binding.pry
    if params[:username] == "" || params[:password] == "" 
        redirect "/login"
    else 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/plants"
            #flasherror could go here
        else
            redirect "/login"
        end
    end
end 

get '/logout' do
    session.clear
    erb :'/users/login.html'
end
  
  # GET: /users/5
  get "/users/:id" do
    @user = User.find_by_id(params[:id])
    erb :"/users/show.html"
  end
  # GET: /users/5/edit
  get "/users/:id/edit" do
    @user = User.find_by_id(params[:id])
    erb :"/users/edit.html"
  end
  # PATCH: /users/5
  patch "/users/:id" do
    @user = User.find_by_id(params[:id])
    if params[:username] == "" || params[:password] == ""
      redirect :"/users/edit.html/"
    else
      @user.username = params[:username]
      @user.password = params[:password]
      @user.save
      redirect "/users/#{@user.id}"
  end
end
  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
      @user = User.find(params[:id])
      #Flash error "Are you sure you want to delete this user? Doing so will delete all contents of this profile?"
      session.clear
      @user.destroy
      redirect "/signup"
  end
end