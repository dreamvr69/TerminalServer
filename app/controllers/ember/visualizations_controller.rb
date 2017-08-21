class Ember::VisualizationsController < ApplicationController
  #before_action :authenticate
  skip_before_filter :verify_authenticity_token

  def create
    client = Mongo::Client.new('mongodb://127.0.0.1:27017/new_fitclubs_development')
    @user.projects.create(params.permit(:data, :creation_date))
    #result = client[:projects].insert_one(params)
  end

  def index
    client = Mongo::Client.new('mongodb://127.0.0.1:27017/new_fitclubs_development')
    @projects = client[:projects].find()
    render json: (@projects.to_json()).gsub('_id','id')
  end

  protected
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @user = User.find_by(authentication_token: token).has_permission(params[:id])
    end
  end

end
