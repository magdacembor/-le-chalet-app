class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :chalet

  validates :user_id, :chalet_id, :check_in_date, :check_out_date, presence: true
  validates :status, presence: true, inclusion: { in: ["Approved", "Declined", "Pending"] }
  validates_uniqueness_of :chalet_id, :scope => [:check_in, :check_out]

end
