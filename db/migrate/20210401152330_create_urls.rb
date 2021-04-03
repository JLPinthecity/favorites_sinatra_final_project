class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :link
      t.belongs_to :user
      t.belongs_to :favorite
    end
  end
end
