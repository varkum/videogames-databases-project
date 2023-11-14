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
   url = Rails.application.routes.recognize_path(request.referrer)
   last_controller = url[:controller]
   if last_controller == "my/wishlists"
    render turbo_stream: turbo_stream.remove(helpers.dom_id(videogame_to_add))
   else
    render partial: "videogames/videogame", object: videogame_to_add
   end
  end

  private
    def set_wishlist
      @wishlist = Current.user.wishlist
    end
end


#my/wishlists vs videogames