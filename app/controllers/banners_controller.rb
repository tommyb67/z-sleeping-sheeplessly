class BannersController < ApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy]

  def index
    @banners = Banner.all
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    @banner.user_id = current_user.id

    if @banner.save
      redirect_to @banner, notice: 'You banner submission was created sucessfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @banner.update(banner_params)
      redirect_to @banner, notice: 'You banner submission was edited sucessfully'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @banner.delete
    redirect_to banners_path, notice: 'You banner submission was deleted sucessfully'
  end

  private

  def banner_params
    params.require(:banner).permit(:start_date, :end_date, :image, :location, :status)
  end

  def set_banner
    @banner = Banner.find(params[:id])
  end
end
