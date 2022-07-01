# frozen_string_literal: true

# app/models/magazine.rb
class MagazinesController < ApplicationController
  def index
    @magazines = Magazine.all
  end

  def new
    @magazine = Magazine.new
  end

  def create
    @magazine = Magazine.new(params.require(:magazine).permit(:name, :cost))
    respond_to do |format|
      if @magazine.save
        format.html { redirect_to magazine_url(@magazine), notice: 'magazine created' }
        format.json { render :show, status: :created, location: @magazine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @magazine = Magazine.find(params[:id])
  end

  def edit
    @magazine = Magazine.find(params[:id])
  end

  def update
    respond_to do |format|
      if @magazine.update(params.require[:magazine].permit(:name, :cost))
        format.html { redirect_to magazine_url(@magazine), notice: 'magazine updated' }
        format.json { render :show, status: :created, location: @magazine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end
end
