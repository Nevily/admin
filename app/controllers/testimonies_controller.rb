class TestimoniesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_testimony, only: [:show, :edit, :update, :destroy]
  
  # GET /testimonies
  # GET /testimonies.json
  def index
    @testimonies = Testimony.all
  end

  # GET /testimonies/1
  # GET /testimonies/1.json
  def show
  end

  # GET /testimonies/new
  def new
    @testimony = Testimony.new
  end

  # GET /testimonies/1/edit
  def edit
  end

  # POST /testimonies
  # POST /testimonies.json
  def create
    @testimony = Testimony.new(testimony_params)
    if @testimony.save
      redirect_to @testimony, notice: 'Testimony was successfully created.'
    else
      render action: 'new' 
    end
  end

  # PATCH/PUT /testimonies/1
  # PATCH/PUT /testimonies/1.json
  def update
    if @testimony.update(testimony_params)
      redirect_to @testimony, notice: 'Testimony was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /testimonies/1
  # DELETE /testimonies/1.json
  def destroy
    @post = @testimony.post 
    @testimony.destroy
    redirect_to @post, notice: 'Testimony was successfully deleted.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_testimony
      @testimony = Testimony.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testimony_params
      params.require(:testimony).permit(:author, :content)
    end
end
