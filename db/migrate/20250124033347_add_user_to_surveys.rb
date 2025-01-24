# frozen_string_literal: true

class AddUserToSurveys < ActiveRecord::Migration[7.1]
  def change
    user = User.find_or_create_by!(email: 'admin@example.com', name: 'Admin User')
    add_reference :surveys, :user, null: false, foreign_key: true, default: user.id
  end
end
