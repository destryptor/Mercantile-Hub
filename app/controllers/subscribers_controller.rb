class SubscribersController < ApplicationController
    allow_unauthenticated_access

    def create
        @product.subscribers.where(subscriber_params).first_or_create
        redirect_to @product, notice: "You have successfully subscribed to #{@product.name}."
    end

    private
        def set_product
            @product = Product.find(params[:product_id])
        end

        def subscriber_params
            params.require(:subscriber).permit(:email)
        end
end
