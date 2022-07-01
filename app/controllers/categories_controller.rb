# frozen_string_literal: true

# app/models/category.rb
class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'category created'
      redirect_to @category
    else
      render 'new'
    end
  end

  def show; end

  def index
    @categories = Category.all
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
