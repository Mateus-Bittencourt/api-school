class Api::V1::UsersController < Api::V1::BaseController
  def create
    skip_authorization
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :kind)
  end

  def render_error
    render json: { errors: @course.errors.full_messages },
           status: :unprocessable_entity # 422
  end
end
