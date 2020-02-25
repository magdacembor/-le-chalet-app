class Review < ApplicationRecord
  belongs_to :user
  belongs_to :chalet

  validates :content, :rating, :user, :chalet, presence: true
  validates :rating, inclusion: { in: (1..5) }
  validates :chalet, uniqueness: { scope: :user, message: "Sorry, you can only review this chalet once." }
end
