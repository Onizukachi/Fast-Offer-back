# frozen_string_literal: true

module Api
  module V1
    class QuestionsController < ApplicationController
      before_action :authenticate_user!, except: %i[index show]
      before_action :set_question, except: %i[index create]

      # GET /api/v1/questions
      def index
        @questions = Question.all.preload(:author, :positions, :tags, :likes, :answers)
        options = {
          include: %i[author positions tags],
          params: { current_user: current_user }
        }

        render json: QuestionSerializer.new(@questions, options)
      end

      # GET /api/v1/questions/:id
      def show
        @question.increment!(:views_count)
        options = {
          include: %i[author positions tags answers.author answers.comments],
          params: { current_user: current_user }
        }

        render json: QuestionSerializer.new(@question, options)
      end

      # POST /api/v1/questions
      def create
        @question = current_user.questions.build(question_params)

        if @question.save
          render json: @question, status: :created
        else
          render json: @question.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/questions/:id
      def update
        if @question.update(question_params)
          render json: @question
        else
          render json: @question.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/questions/:id
      def destroy
        @group.destroy
      end

      private

      def set_question
        @question = Question.preload(:author, :positions, :tags, :likes, answers: %i[author comments]).find params[:id]
      end

      def question_params
        params.require(:question).permit(:body).merge(author: current_user)
      end
    end
  end
end
