class OfficesController < ApplicationController
  before_action :set_office, only: %i[ show  cabins ]
  def index
    @offices=Office.all
  end
  def show
  end
  def cabins
    @cabins=@office.cabins
  end
  def new
    @office = Office.new
  end
  def create
    @office = Office.new(params.require(:office).permit(:name,:place))

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
  private
  def set_office
    @office=Office.find(params[:id])
  end
end
