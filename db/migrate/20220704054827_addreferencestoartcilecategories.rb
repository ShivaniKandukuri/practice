class Addreferencestoartcilecategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :article_categories, :article, index: true
    add_reference :article_categories, :category, index: true
  end
end
