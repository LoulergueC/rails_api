class AddUserToArticles < ActiveRecord::Migration[7.1]
  def change
    add_reference :articles, :user
  end
end
