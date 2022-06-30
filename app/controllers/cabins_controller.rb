class CabinsController < ApplicationController
  before_action :set_cabin, only: %i[ show ]
  def index
    @cabins=Cabin.all
  end
  def show
    @cabin=Cabin.find(params[:id])
  end
  def new
    @cabin = Cabin.new
  end
  def create
    @cabin = Cabin.new(params.require(:cabin).permit(:count))

    respond_to do |format|
      if @cabin.save
        format.html { redirect_to cabin_url(@cabin), notice: "created" }
        format.json { render :show, status: :created, location: @cabin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cabin.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  def set_cabin
    @cabin=Cabin.find(params[:id])
  end
end
