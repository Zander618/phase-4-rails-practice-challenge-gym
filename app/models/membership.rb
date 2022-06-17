class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client
  validates :gym_id, legnth: {maximum: 1}
end
