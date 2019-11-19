class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = current_user.bands
  end

  def show
  end

  def new
    @band = Band.new
  end

  def create
    @band = current_user.bands.new(band_params)
    if @band.save
      flash[:success] = "Band Added"
      redirect_to bands_path
    else
      flash[:error] = "Error #{@band.errors.full_messages.join('\n')}"
      render :new
    end
  end

  def edit
  end

  def update
    if @band.update(band_params)
      redirect_to bands_path
    else
      render :edit
    end
  end

  def destroy
    @band.destroy
    redirect_to bands_path
  end

  private
  def set_band
    @band = current_user.bands.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :genre)
  end
end