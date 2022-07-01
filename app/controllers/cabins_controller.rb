class CabinsController < ApplicationController
  before_action :set_cabin, only: %i[ show edit update destroy]
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
    @cabin = Cabin.new(cabin_params)

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
  def edit
  end
  def update
    respond_to do |format|
      if @cabin.update(cabin_params)
        format.html { redirect_to cabin_url(@cabin), notice: "Cabin was successfully updated." }
        format.json { render :show, status: :ok, location: @cabin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cabin.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @cabin.destroy
    respond_to do |format|
      format.html { redirect_to cabins_url, notice: "Cabin was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
  def set_cabin
    @cabin=Cabin.find(params[:id])
  end
  def cabin_params
    params.require(:cabin).permit(:count)
  end
end
