class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.belongs_to :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
