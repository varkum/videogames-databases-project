class WishlistsController < ApplicationController
  before_action :set_wishlist


  # GET /wishlists/1 or /wishlists/1.json
  def show
  end

 

  # GET /wishlists/1/edit
  def edit
  end


  # PATCH/PUT /wishlists/1 or /wishlists/1.json
  def update
    respond_to do |format|
      if @wishlist.update(wishlist_params)
        format.html { redirect_to wishlist_url(@wishlist), notice: "Wishlist was successfully updated." }
        format.json { render :show, status: :ok, location: @wishlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
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
