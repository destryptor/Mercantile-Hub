class ProductsController < ApplicationController
  allow_unauthenticated_access

  def index
    @query = params[:q].to_s.strip
    @products = Product.all

    if @query.present?
      terms = @query.downcase.split(/\s+/).uniq
      terms.each do |term|
        @products = @products.where("LOWER(products.name) LIKE ?", "%#{term}%")
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
