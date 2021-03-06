class User < ActiveRecord::Base
  has_one :account, dependent: :destroy
  accepts_nested_attributes_for :account
  validates :account, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  def with_account
    self.build_account
    self
  end
end
