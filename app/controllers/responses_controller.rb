# frozen_string_literal: true

class ResponsesController < ApplicationController
  def create
    @survey = Survey.find(params[:survey_id])
    @response = @survey.responses.build(response_params)

    if @response.save
      redirect_to survey_path(@survey), notice: 'Response was successfully recorded.'
    else
      redirect_to survey_path(@survey), alert: 'Error recording response.'
    end
  end

  private

  def response_params
    params.require(:response).permit(:answer)
  end
end
