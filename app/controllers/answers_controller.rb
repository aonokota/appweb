class AnswersController < ApplicationController
	before_action :set_answer, only: [:show, :edit, :update, :destroy]


	def index
		redirect_to '/questions'
	end


	def show
		redirect_to '/questions'
	end


	def new
		@answer = Answer.new
	end


	def edit
		redirect_to '/questions'
	end


	def create
		end_counter = 10 # 終了にする回答数
		@answer = Answer.new(answer_params)
		respond_to do |format|
			if @answer.save
				num = Answer.where('question_id = ?',@answer.question_id).count
				if num >= end_counter then
					q = Question.find @answer.question_id
					q.finished = true
					q.save
				end
				format.html {
					redirect_to '/questions/' + @answer.question_id.to_s
				}
				format.json { render :show, status: :created, location: @answer }
			else
				format.html { render :new }
				format.json { render json: @answer.errors, status: :unprocessable_entity }
			end
		end
	end


	def update
		redirect_to '/questions'
	end


	def destroy
		redirect_to '/questions'
	end


	private
	def set_answer
		@answer = Answer.find(params[:id])
	end


	def answer_params
		params.require(:answer).permit(:question_id, :content, :name)
	end
end