# frozen_string_literal: true

module Api
  module V1
    class AnswersController < ApplicationController
      before_action :authenticate_user!
      before_action :set_question!

      # POST /api/v1/questions/:id/answers
      def create
        @answer = @question.answers.build answer_params

        if @answer.save
          render template: 'api/v1/answers/create', formats: :json
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/questions/:id/answers/:id
      def update
        if @answer.update(answer_params)
          render json: @answer
        else
          render json: @answer.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/questions/:id/answers/:id
      def destroy
        @answer.destroy
      end

      private

      def set_question!
        @question = Question.find params[:question_id]
      end

      def set_answer!
        @answer = @question.answers.find(params[:id])
      end

      def answer_params
        params.require(:answer).permit(:body).merge(author: current_user)
      end
    end
  end
end
