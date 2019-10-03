class AddressesController < ApplicationController
    private
    def address_params
      params.require(:address).permit(:user_id,:address,:post_number)
    end
end
