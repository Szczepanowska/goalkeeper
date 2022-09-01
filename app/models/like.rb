class Like < ApplicationRecord
  belongs_to :goal
  belongs_to :user, optional: true
end
