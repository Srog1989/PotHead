class PlanTsController < ApplicationController

  # GET: /plan_ts
  get "/plan_ts" do
    erb :"/plan_ts/index.html"
  end

  # GET: /plan_ts/new
  get "/plan_ts/new" do
    erb :"/plan_ts/new.html"
  end

  # POST: /plan_ts
  post "/plan_ts" do
    redirect "/plan_ts"
  end

  # GET: /plan_ts/5
  get "/plan_ts/:id" do
    erb :"/plan_ts/show.html"
  end

  # GET: /plan_ts/5/edit
  get "/plan_ts/:id/edit" do
    erb :"/plan_ts/edit.html"
  end

  # PATCH: /plan_ts/5
  patch "/plan_ts/:id" do
    redirect "/plan_ts/:id"
  end

  # DELETE: /plan_ts/5/delete
  delete "/plan_ts/:id/delete" do
    redirect "/plan_ts"
  end
end
