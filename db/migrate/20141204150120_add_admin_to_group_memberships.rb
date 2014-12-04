class AddAdminToGroupMemberships < ActiveRecord::Migration
  def change
    add_column :group_memberships, :admin, :boolean, null: false, default: false
  end
end
