class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/messages" do
    msg = Message.order("created_at")
    msg.to_json
  end

  post "/messages" do
    createNew = Message.create(body: params[:body], username: params[:username])
    createNew.to_json
  end

  patch "/messages/:id" do
    find = Message.find(params[:id])
    find.update(body: params[:body])
    find.to_json
  end

  delete "/messages/:id" do
    delete = Message.find(params[:id])
    delete.destroy
  end
end
