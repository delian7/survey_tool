# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:john_doe)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    assert_not duplicate_user.valid?
  end

  test 'should have many surveys' do
    assert_respond_to @user, :surveys
  end

  test 'should destroy associated surveys when destroyed' do
    user = User.create!(email: 'adam@example.com', name: 'Adam Doe')

    user.surveys.create!(question: 'Test question?', user: user)
    assert_difference('Survey.count', -1) do
      user.destroy
    end
  end
end
