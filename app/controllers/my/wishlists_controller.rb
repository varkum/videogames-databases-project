class My::WishlistsController < ApplicationController
  before_action :set_wishlist

  def show
    @wishlist_videogames = @wishlist.videogames
  end

  def update
    videogame_to_add = Videogame.find(params[:videogame])
    if @wishlist.videogames.include? videogame_to_add
      @wishlist.videogames.destroy videogame_to_add
    else
      @wishlist.videogames << videogame_to_add
   end
   Rails.logger.info action_name + " here!"
   render partial: "videogames/videogame", object: videogame_to_add
  end

  private
    def set_wishlist
      @wishlist = Current.user.wishlist
    end
end
