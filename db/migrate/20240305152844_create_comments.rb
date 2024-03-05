class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.references :article
      t.references :user

      t.timestamps
    end
  end
end
