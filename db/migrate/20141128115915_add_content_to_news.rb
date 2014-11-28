class AddContentToNews < ActiveRecord::Migration
  def change
    add_column :news, :content, :text, after: :body
  end
end
