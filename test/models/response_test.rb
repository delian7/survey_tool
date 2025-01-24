# frozen_string_literal: true

require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  def setup
    @response = responses(:response_one)
  end

  test 'should be valid' do
    assert @response.valid?
  end

  test 'should belong to survey' do
    assert_respond_to @response, :survey
  end

  test 'answer should be boolean' do
    @response.answer = nil
    assert_not @response.valid?

    @response.answer = true
    assert @response.valid?

    @response.answer = false
    assert @response.valid?
  end
end
