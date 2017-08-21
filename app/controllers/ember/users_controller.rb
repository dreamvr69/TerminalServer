class Ember::UsersController < Ember::BaseController
  before_action :authenticate_user!, except: :authenticate

  # def authenticate
  #   user = User.find_by(email: params[:user][:email])
  #   if user.nil?
  #     head 404
  #   else
  #     if user.valid_password?(params[:user][:password])
  #       if user.has_role?(:client)
  #         head 401
  #       else
  #         if user.auth_date.nil?
  #           user.auth_date = DateTime.now
  #           user.save
  #         end
  #         data = {
  #             token: user.authentication_token,
  #             user_id: user.id.to_s,
  #             email: user.email
  #         }
  #         render json: data, status: :ok
  #       end
  #     else
  #       head 401
  #     end
  #   end
  # end

  def authenticate
    user = User.find_by(email: params[:user][:email])

    puts 'USER'
    puts user

    if user.nil?
      head 401
      return false
    else
      if user.valid_password?(params[:user][:password])
        puts 'VALID!!!'
              data = {
                  token: user.authentication_token,
                  user_id: user.id.to_s,
                  email: user.email
              }
              puts data
              render json: data, status: :ok
      else
        head 401
      end
    end

  end

end
