class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  belongs_to :account
  has_many :pages, foreign_key: "owner_id"
  has_many :collaborations
  has_many :joint_pages, through: :collaborations, source: :page

  before_create :build_account

  delegate :role?, to: :account


  private

  def build_account
    self.account = Account.create!(plan: "free")
  end
end
