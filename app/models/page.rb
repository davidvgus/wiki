class Page < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  scope :public, -> { where(private: false) }
end
