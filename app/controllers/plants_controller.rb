class PlanTsController < ApplicationController

 # GET: /platns
 get "/plants" do
  if logged_in?
     @user = User.find_by(session[:user_id])
     @plants = @user.plants.all
      erb :"/plants/index.html"
  else
      redirect '/login'
end
end
# GET: /plants/new
get "/plants/new" do


  erb :"/plants/new.html"
end

# POST: /plants
post "/plants" do
  user = User.find_by(session[:user_id])
  @plant = user.plants.create(params)
  redirect "/plants/#{@plant.id}"
end
# GET: /plants/5
get "/plants/:id" do
  @plant = Plant.find_by_id(params[:id])
  erb :"/plants/show.html"
end
# GET: /plants/5/edit
get "/plants/:id/edit" do
  @plant = Plant.find_by_id(params[:id])
  erb :"/plants/edit.html"
end
# PATCH: /plants/5
patch "/plants/:id" do
  
  redirect "/plants/:id"
end
# DELETE: /plants/5/delete
delete "/plants/:id/delete" do
  @plant = Plant.find_by_id(params[:id])
  @plant.destroy
  redirect "/plants"
end
end
