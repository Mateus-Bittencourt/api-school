class Api::V1::LecturesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User # , except: %i[index show]
  before_action :set_lecture, only: %i[show update destroy]

  def index
    @lectures = policy_scope(Lecture.where(course_id: params[:course_id]))
  end

  def show; end

  def update
    if @lecture.update(lecture_params)
      render :show
    else
      render_error
    end
  end

  def create
    @lecture = Lecture.new(lecture_params)
    @lecture.course_id = params[:course_id]
    authorize @lecture
    if @lecture.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    if @lecture.destroy
      head :no_content
    else
      render_error
    end
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
    authorize @lecture
  end

  def lecture_params
    params.require(:lecture).permit(:title, :content, :video_url)
  end

  def render_error
    render json: { errors: @lecture.errors.full_messages },
           status: :unprocessable_entity # 422
  end

  def pundit_user
    current_user.kind == 'teacher' ? current_user.becomes(Teacher) : current_user.becomes(Student)
  end

end
