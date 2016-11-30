class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :movies
  belongs_to :user_group
  has_many :reviews, dependent: :destroy
  has_many :user_roles
  has_many :roles, through: :user_roles

  before_create :set_default_group
  private
  def set_default_group
    self.user_group ||= UserGroup.find(2)
  end
end
