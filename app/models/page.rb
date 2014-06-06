class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :owner, class_name: "User"
  has_many :collaborations
  has_many :collaborators, through: :collaborations,
    source: :user
  scope :public, -> { where(private: false) }
end
