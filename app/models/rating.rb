class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :movie_id, presence: true
  validates :rating, presence: true, inclusion: (1..10)
  validates :user_id, presence: true
end
