class RemoveNameFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :name, :string
  end
end
