# frozen_string_literal: true

# The Response class represents an individual response to a survey question.
# It belongs to a survey and validates that the answer is either true or false.
class Response < ApplicationRecord
  belongs_to :survey
  validates :answer, inclusion: { in: [true, false] }
end
