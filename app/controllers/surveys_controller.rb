# frozen_string_literal: true

class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    @response = Response.new
  end

  def new
    @survey = current_user.surveys.new
  end

  def create
    @survey = current_user.surveys.new(survey_params)
    if @survey.save
      redirect_to root_path, notice: 'Survey was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:question)
  end
end
