class My::WishlistsController < ApplicationController
  before_action :set_wishlist


  # GET /wishlists/1 or /wishlists/1.json
  def show
  end

 

  # GET /wishlists/1/edit
  def edit
  end


  # PATCH/PUT /wishlists/1 or /wishlists/1.json
  def update
    videogame_to_add = Videogame.find(params[:videogame])
    if Current.user.wishlist.videogames.include? videogame_to_add
      Current.user.wishlist.videogames.destroy videogame_to_add
    else
      Current.user.wishlist.videogames << videogame_to_add
   end

   render partial: "videogames/videogame", object: videogame_to_add
  end

  private
    def set_wishlist
      @wishlist = Current.user.wishlist
    end

    # Only allow a list of trusted parameters through.
    def wishlist_params
      params.require(:wishlist).permit(:user_id)
    end
end
