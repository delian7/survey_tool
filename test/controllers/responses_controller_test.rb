# frozen_string_literal: true

require 'test_helper'

class ResponsesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @survey = surveys(:survey_one)
  end

  test 'should create response' do
    assert_difference('Response.count') do
      post survey_responses_url(@survey), params: { response: { answer: true } }
    end

    assert_redirected_to surveys_url
  end

  test 'should not create response with invalid params' do
    assert_no_difference('Response.count') do
      post survey_responses_url(@survey), params: { response: { answer: nil } }
    end

    assert_redirected_to survey_url(@survey)
  end
end
