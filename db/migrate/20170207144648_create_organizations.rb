class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.integer :organization_id
      t.string :name

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
