class CreateVideogameWishlistJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :videogames, :wishlists do |t|
      t.index :videogame_id
      t.index :wishlist_id
    end
  end
end
