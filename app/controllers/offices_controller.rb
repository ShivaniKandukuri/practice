class OfficesController < ApplicationController
  before_action :set_office, only: %i[ show edit update destroy cabins ]
  def index
    @offices=Office.all
  end
  def show
  end
  def cabins
    @cabins=@office.cabins
  end
  def search_office
    @cabins=Cabin.all
  end
  def new
    @office = Office.new
  end
  def create
    @office = Office.new(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to user_url(@office), notice: "created" }
        format.json { render :show, status: :created, location: @office }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end
  def edit
  end
  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to office_url(@office), notice: "Office was successfully updated." }
        format.json { render :show, status: :ok, location: @office }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to cabins_url, notice: "Office was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
  def set_office
    @office=Office.find(params[:id])
  end
  def office_params
    params.require(:office).permit(:name,:place)
  end
end
