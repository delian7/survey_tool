# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :survey
  validates :answer, inclusion: { in: [true, false] }
end
