class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string     :title
      t.text       :body
      t.references :source, index: true
      t.datetime   :date
      t.string     :guid
      t.string     :url

      t.timestamps
    end
    add_index :news, :title
    add_index :news, :guid
  end
end
