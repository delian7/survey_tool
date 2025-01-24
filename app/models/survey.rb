# frozen_string_literal: true

# The Survey class represents a survey with a question and associated responses.
# It provides methods to calculate the percentage of 'yes' and 'no' responses.
class Survey < ApplicationRecord
  has_many :responses, dependent: :destroy
  validates :question, presence: true

  def yes_percentage
    return 0 if responses.empty?

    (responses.where(answer: true).count.to_f / responses.count * 100).round(1)
  end

  def no_percentage
    return 0 if responses.empty?

    (responses.where(answer: false).count.to_f / responses.count * 100).round(1)
  end
end
