class Group < ActiveRecord::Base
  validates :title, presence: :true

  has_many :group_memberships
  has_many :users, through: :group_memberships
end
