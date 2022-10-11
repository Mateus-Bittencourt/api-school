class Api::V1::SubscriptionsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    @subscriptions = policy_scope(Subscription)
  end

  def create
    @subscription = Subscription.new(user: current_user, course_id: params[:course_id])
    # @subscription.user = current_user
    authorize @subscription
    if @subscription.save
      render :index, status: :created
    else
      render_error
    end
  end

  def destroy
    @subscription = ubscription.find(params[:id])
    authorize @subscription
    if @subscription.destroy
      head :no_content
    else
      render_error
    end
  end

  private

  # def subscription_params
  #   params.require(:subscription).permit(:course_id)
  # end

  def render_error
    render json: { errors: @subscription.errors.full_messages },
           status: :unprocessable_entity # 422
  end
end
