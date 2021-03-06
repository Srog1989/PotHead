class PlanTsController < ApplicationController
  # GET: /platns
  get "/plants" do
    if logged_in?
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
      @plant = current_user.plants.create(params)
    if @plant.valid?
      redirect "/plants/#{@plant.id}"
    else 
      redirect "/plants/new"
    end
  end

  # GET: /plants/5
  get "/plants/:id" do
    @plant = Plant.find(params[:id])
    erb :"/plants/show.html"
  end

  # GET: /plants/5/edit
  get "/plants/:id/edit" do
    @plant = Plant.find(params[:id])
    if @plant.user != current_user
      redirect "/plants"
    else
      erb :"/plants/edit.html"
    end
  end

  # PATCH: /plants/5
  patch "/plants/:id" do
    @plant = Plant.find(params[:id])
    @plant.name = params[:name]
    @plant.light_needs = params[:light_needs]
    @plant.water_needs =  params[:water_needs]
    @plant.save
    if @plant.valid?
      redirect "/plants/#{@plant.id}"
    else
      redirect "/plants/#{@plant.id}/edit"
    end
  end

  # DELETE: /plants/5/delete
    delete "/plants/:id/delete" do
      @plant = Plant.find(params[:id])
      @plant.destroy
      redirect "/plants"
    end
end
