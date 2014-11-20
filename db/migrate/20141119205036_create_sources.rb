class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.string :description
      t.string :uri

      t.timestamps
    end
    add_index :sources, :title
  end
end
