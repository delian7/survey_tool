# frozen_string_literal: true

require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  def setup
    @survey = surveys(:survey_one)
  end

  test 'should get index' do
    get root_url
    assert_response :success
    assert_select 'h1', 'Surveys'
  end

  test 'should get new' do
    get new_survey_url
    assert_response :success
  end

  test 'should create survey' do
    assert_difference('Survey.count') do
      post surveys_url, params: { survey: { question: 'New test question?' } }
    end

    assert_redirected_to root_url
  end

  test 'should not create survey with invalid params' do
    assert_no_difference('Survey.count') do
      post surveys_url, params: { survey: { question: '' } }
    end

    assert_response :unprocessable_entity
  end

  test 'should show survey' do
    get survey_url(@survey)
    assert_response :success
  end
end
