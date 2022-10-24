class Api::V1::SessionsController < Api::V1::BaseController
  def create
    skip_authorization
    @user = User.find_for_authentication(email: user_params.fetch(:email))
    return render json: { error: 'Invalid email' }, status: :unauthorized unless @user

    if @user.valid_password?(user_params.fetch(:password))
      render :create # json: { name: user.name, email: user.email, token: user.authentication_token }
    else
      render json: { error: 'Invalid password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
