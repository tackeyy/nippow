class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.integer :status
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
