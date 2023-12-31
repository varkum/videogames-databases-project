class VideogamesController < ApplicationController
  before_action :set_videogame, only: %i[ show edit update destroy ]

  # GET /videogames or /videogames.json
  def index
    @pagy, @videogames = pagy(Videogame.all, items: 25)
    session[:filters] = {}
  end

  def search
    @pagy, @videogames = pagy(Videogame.search(params[:name]), items: 25)
    render :index
  end

  def sort
    case params[:sort_by]
    when "best_selling"
      @videogames = Videogame.joins(:sale).order("sales.value DESC")
    when "highest_rated"
      @videogames = Videogame.order(average_score: :desc)
    else
      @videogames = Videogame.all
    end

    @pagy, @videogames = pagy(@videogames, items: 25)
    render :index
  end

  def filter
    @videogames = Videogame.all
    session[:filters].merge!(filter_params.to_h)
    session[:filters].each do |attribute, query|
      @videogames = Videogame.filter(@videogames, attribute, query)
    end

    @pagy, @videogames = pagy(@videogames, items: 25)
    render :index
  end

  # GET /videogames/1 or /videogames/1.json
  def show
  end

  # GET /videogames/new
  def new
    @videogame = Videogame.new
  end

  # GET /videogames/1/edit
  def edit
  end

  # POST /videogames or /videogames.json
  def create
    @videogame = Videogame.new(videogame_params)

    respond_to do |format|
      if @videogame.save
        format.html { redirect_to videogame_url(@videogame), notice: "Videogame was successfully created." }
        format.json { render :show, status: :created, location: @videogame }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @videogame.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videogames/1 or /videogames/1.json
  def update
    respond_to do |format|
      if @videogame.update(videogame_params)
        format.html { redirect_to videogame_url(@videogame), notice: "Videogame was successfully updated." }
        format.json { render :show, status: :ok, location: @videogame }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @videogame.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videogames/1 or /videogames/1.json
  def destroy
    @videogame.destroy!

    respond_to do |format|
      format.html { redirect_to videogames_url, notice: "Videogame was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_videogame
      @videogame = Videogame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def videogame_params
      params.require(:videogame).permit(:name, :platform, :year, :developer, :genre, :editorschoice)
    end

    def filter_params
      params.permit(Videogame::FILTER_ATTRIBUTES)
  end
end
