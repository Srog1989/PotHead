class PlanTsController < ApplicationController

 # GET: /platns
 get "/plants" do
  if logged_in?
     current_user
     @plants = current_user.plants.all
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
  if params[:name] == "" || params[:light_needs] == "" || params[:water_needs] == ""
    redirect "/plants/new"
  else @plant = current_user.plants.create(params)
  erb :"/plants/show.html"
end
  redirect "/plants/new"
end

# GET: /plants/5
get "/plants/:id" do
  @plant = Plant.find(params[:id])
  erb :"/plants/show.html"
end

# GET: /plants/5/edit
get "/plants/:id/edit" do
  @plant = Plant.find(params[:id])
  if @plant.user_id.to_i != current_user.id
    redirect "/plants"
  else
    erb :"/plants/edit.html"
  end
end

# PATCH: /plants/5
patch "/plants/:id" do
@plant = Plant.find(params[:id])
  if params[:name] == "" || params[:light_needs] == "" || params[:water_needs] == ""
    redirect :"/plants/edit.html/"
  else
    @plant.name = params[:name]
    @plant.light_needs = params[:light_needs]
    @plant.water_needs =  params[:water_needs]
    @plant.save
    redirect "/plants/#{@plant.id}"
end
end
# DELETE: /plants/5/delete
delete "/plants/:id/delete" do
  @plant = Plant.find_by_id(params[:id])
  @plant.destroy
  redirect "/plants"
end
end
