class CreateJobs < ActiveRecord::Migration[7.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.boolean :is_completed

      t.timestamps
    end
  end
end

