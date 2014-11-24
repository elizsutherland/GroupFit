class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :image_url, presence: true

  has_many :group_memberships
  has_many :groups, through: :group_memberships
  has_many :workouts

  def membership_for(group)
    group_memberships.where(group_id: group.id).first
  end
end
