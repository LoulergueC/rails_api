class AddPrivateArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :private, :boolean, default: false
  end
end
