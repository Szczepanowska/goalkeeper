class Task < ApplicationRecord
  belongs_to :goal

  scope :completed, -> { where(completed: true) }
end
