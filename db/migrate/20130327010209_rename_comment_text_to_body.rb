class RenameCommentTextToBody < ActiveRecord::Migration
  def up
    rename_column :comments, :comment, :body
  end

  def down
  end
end
