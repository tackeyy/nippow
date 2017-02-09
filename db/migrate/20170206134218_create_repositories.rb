class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.integer :organization_id,     null: false
      t.integer :repo_id,             null: false
      t.string :name,                 null: false

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
