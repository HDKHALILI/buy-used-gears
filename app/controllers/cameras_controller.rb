class CamerasController < ApplicationController
  before_action :set_camera, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :owned_camera, only: [:edit, :update, :destroy]

  # GET /cameras
  # GET /cameras.json
  def index
    @cameras = Camera.all
  end

  # GET /cameras/1
  # GET /cameras/1.json
  def show
  end

  # GET /cameras/new
  def new
    @camera = current_user.cameras.build
  end

  # GET /cameras/1/edit
  def edit
  end

  # POST /cameras
  # POST /cameras.json
  def create
    @camera = current_user.cameras.build(camera_params)

    respond_to do |format|
      if @camera.save
        format.html { redirect_to @camera, notice: 'Camera was successfully created.' }
        format.json { render :show, status: :created, location: @camera }
      else
        format.html { render :new }
        format.json { render json: @camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cameras/1
  # PATCH/PUT /cameras/1.json
  def update
    respond_to do |format|
      if @camera.update(camera_params)
        format.html { redirect_to @camera, notice: 'Camera was successfully updated.' }
        format.json { render :show, status: :ok, location: @camera }
      else
        format.html { render :edit }
        format.json { render json: @camera.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cameras/1
  # DELETE /cameras/1.json
  def destroy
    @camera.destroy
    respond_to do |format|
      format.html { redirect_to cameras_url, notice: 'Camera was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def who_bought
    @camera = Camera.find(params[:id])
    @latest_order = @product.orders.order[:updated_at].last
    
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camera
      @camera = Camera.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camera_params
      params.require(:camera).permit(:brand, :model, :description, :title, :color, :condition, :price, :image)
    end

    def owned_camera
      unless current_user == @camera.user
        flash[:alert] = "That listing is not yours"
        redirect_to root_path
      end
    end
end
