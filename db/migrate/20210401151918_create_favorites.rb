class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.string :category
      t.string :name
      t.string :notes
      t.belongs_to :user

      t.timestamps
    end
  end
end
