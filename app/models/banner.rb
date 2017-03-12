class Banner < ApplicationRecord
  enum status: { submitted: 0, assigned: 1, completed: 2, rejected: 3, approved: 4 }
  belongs_to :user
  validates_presence_of :start_date, :end_date, :image, :location

  scope :banners_by, ->(user) { where(user_id: user.id) }
end

