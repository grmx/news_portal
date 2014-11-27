class ChangeNewsTitleToText < ActiveRecord::Migration
  def up
    change_column :news, :title, :text, limit: 510
  end

  def down
    change_column :news, :title, :string, limit: 255
  end
end
