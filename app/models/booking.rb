class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :chalet

  validates :user_id, presence: true
  validates :chalet_id, presence: true
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates_uniqueness_of :chalet_id, :scope => [:check_in, :check_out]
end
