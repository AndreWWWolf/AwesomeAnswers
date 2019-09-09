class QuestionsController < ApplicationController

  before_action :find_question, only: [:show, :edit, :update, :destroy]

  # rails g controller questions new
  def new
    @question = Question.new
    render :new
  end


  def create
    @question = Question.new question_params

    if @question.save
      flash[:notice] = "Question created successfully"
      #if question is saved successfully redirect them to the question they just created
      redirect_to question_path(@question)
    else
      #if question is not saved successfully render new
      render :new
    end

  end

  def show
    # @question = Question.find(params[:id])
    @answer  = Answer.new

    @answers = @question.answers.order(created_at: :desc)
  end

  def index
    @questions = Question.all
  end

  def edit
  end

  def update
    #for user to update the existing question, they must edit and then save it
    if @question.update question_params
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy 
    flash[:notice] = "Question destroyed!"
    @question.destroy
    redirect_to questions_path
  end



  private

  def question_params
    #params.require(:question): we must have a question object on the params of this request
    params.require(:question).permit(:title, :body)
  end

  def find_question
    #this will get the current value inside of the db
    @question = Question.find params[:id]
  end

end
