class AddDateToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :date, :datetime
  end
end
