class Submission < ActiveRecord::Base
  validates :location,
    format: { with: /\A[^\/]+\/[^\/]+\z/ },
    uniqueness: true
end
