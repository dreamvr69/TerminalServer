class Ember::ProjectsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    include Pundit

  def index
    client = Mongo::Client.new('mongodb://127.0.0.1:27017/new_fitclubs_development')
    @events = client[:events].find()
    render json: (@events.as_json()).each {|el| el['id']=el['_id']}
  end

  def index_user
    if @current_user.can_read_owned_by_user(params[:user_id])
      @projects = Project.find_by user_id: params[:user_id]
      render json: (@projects.as_json()).each {|el| el['id']=el['_id']}
    else
      head 403
    end
  end

  def create
    #Comment.create(:body => params[:body], :title => params[:title], :manager_name => params[:manager_name])
    @user.projects.create(params.permit(:name, :begin, :end))
    #
    # if result == 1
    #   respond_to do |format|
    #
    #     format.html
    #     format.json {render :nothing => true}
    #
    #   end
    # else
    #   render 'new'
    # end
    render :nothing => true
  end

  protected
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @curren_user = User.find_by(authentication_token: token)
    end
  end
end
