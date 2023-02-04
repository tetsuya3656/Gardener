class Public::QuestionsController < ApplicationController
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to questions_path, notice:"質問が投稿されました。"
    else
      render :new
    end  
  end

  def index
    @questions = Question.all
    @questions = @questions.where('title LIKE ? OR body LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  end

  def show
     @question = Question.find(params[:id])
     @question_comment = QuestionComment.new
  end

  def edit
     @question = Question.find(params[:id])
    
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
     redirect_to question_path(@question.id), notice:"質問内容を編集しました。"
    else
     render :edit
    end
  end  
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to '/questions'
  end
  
  def searches
    @questions = Question.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
  
  private
  def question_params
     params.require(:question).permit(:user_id, :image, :title, :body)
  end   
end
