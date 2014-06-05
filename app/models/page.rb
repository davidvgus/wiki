class Page < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :owner, class_name: "User"
  scope :public, -> { where(private: false) }
end
