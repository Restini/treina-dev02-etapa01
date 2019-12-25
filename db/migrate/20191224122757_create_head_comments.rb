class CreateHeadComments < ActiveRecord::Migration[5.2]
  def change
    create_table :head_comments do |t|
      t.string :username
      t.text :body
      t.references :head_proposal, foreign_key: true

      t.timestamps
    end
  end
end
