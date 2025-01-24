# frozen_string_literal: true

class User < ApplicationRecord
  has_many :surveys, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
