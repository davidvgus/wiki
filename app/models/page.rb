class Page < ActiveRecord::Base
  scope :public, -> { where(private: false) }
end
