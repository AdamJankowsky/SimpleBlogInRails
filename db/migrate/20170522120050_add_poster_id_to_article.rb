class AddPosterIdToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :poster_id, :integer
  end
end
