# frozen_string_literal: true

require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  def setup
    @user = users(:john_doe)
    @survey = surveys(:survey_one)
  end

  test 'should belong to user' do
    assert_respond_to @survey, :user
  end

  test 'should be valid' do
    assert @survey.valid?
  end

  test 'question should be present' do
    @survey.question = ''
    assert_not @survey.valid?
  end

  test 'should calculate correct yes percentage' do
    assert_equal 50.0, @survey.yes_percentage
  end

  test 'should calculate correct no percentage' do
    assert_equal 50.0, @survey.no_percentage
  end

  test 'should handle zero responses' do
    new_survey = Survey.create(question: 'New question?', user: @user)
    assert_equal 0, new_survey.yes_percentage
    assert_equal 0, new_survey.no_percentage
  end
end
