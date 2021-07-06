class ChangeRelationshipsColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :follower_id, :integer 
    add_column :relationships, :followed_id, :integer
    remove_column :relationships, :comment, :text
    remove_column :relationships, :post_image_id, :integer
    remove_column :relationships, :user_id, :integer
  end
end
