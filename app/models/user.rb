class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  belongs_to :account
  #validates_presence_of :account

  before_create :build_account


  private

  def build_account
    self.account = Account.create!(plan: "free")
  end
end
