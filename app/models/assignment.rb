class Assignment < ActiveRecord::Base
  validates :location,
    format: { with: /github.com.[^\/]+\/[^\/]+\z/ },
    uniqueness: true
end
