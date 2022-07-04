# frozen_string_literal: true

# app/models/category.rb
class CategoriesController < ApplicationController
  before_action :require_admin, except:[:index,:show]
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

  def show
    @category=Category.find(params[:id])
    @articles = @category.articles.paginate(:page => params[:page], :per_page=>2)
  end

  def index
    @categories = Category.paginate(:page => params[:page], :per_page=>1)
  end

  def edit
    @category=Category.find(params[:id])
  end

  def update
    @category=Category.find(params[:id])
    if @category.update?
      flash[:notice]="updated successfully"
      redirect_to @category
    else
      render 'edit'
    end

  private

  def category_params
    params.require(:category).permit(:name)
  end
  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:notice]="abort"
      redirect_to 'categories_path'
    end
  end
end
