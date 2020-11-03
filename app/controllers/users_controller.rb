class UseRsController < ApplicationController
    
    get '/signup' do
        if logged_in?
            redirect to '/plants'
        else 
            erb :'users/signup.html'
        end 
    end 

    post '/signup' do
        user =User.create(:username => params[:username], :password => params[:password])
        if user.valid?
            session[:user_id] = user.id
            redirect "/plants"
        else
            redirect "/signup"
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
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/plants"
        else
            redirect "/login"
        end
    end

    get '/logout' do
        session.clear
        erb :'/users/login.html'
    end
    
    # GET: /users/5
    get "/users/:id" do
        @user = User.find(params[:id])
        erb :"/users/show.html"
    end

    # GET: /users/5/edit
    get "/users/:id/edit" do
        @user = User.find(params[:id])
        erb :"/users/edit.html"
    end

    # PATCH: /users/5
    patch "/users/:id" do
        @user = User.find(params[:id])
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
        session.clear
        @user.destroy
        redirect "/signup"
    end
end