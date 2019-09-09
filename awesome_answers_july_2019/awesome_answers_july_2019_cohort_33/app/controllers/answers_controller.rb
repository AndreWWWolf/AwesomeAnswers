class AnswersController < ApplicationController
    def create
        @question = Question.find(params[:question_id])
        @answer = Answer.new answer_params
        @answer.question = @question
        if @answer.save
            redirect_to question_path(@question)
        else
         # For the list of answers
        @answers = @question.answers.order(created_at: :desc)
        render 'questions/show'
        end
    end

    def destroy
        @question = Question.find params[:question_id]
        @answer = Answer.find params[:id]
        @answer.destroy
        redirect_to question_path(@question),
        notice: 'Question Deleted'
    end


    private

    def answer_params
        params.require(:answer).permit(:body)
    end

end