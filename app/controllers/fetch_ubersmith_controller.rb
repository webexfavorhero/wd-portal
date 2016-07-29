class FetchUbersmithController < ApplicationController

  def index
    case params[:type]
    when "products"
      Product.save_data_from_api
    when "upgrades"
      Upgrade.save_data_from_api
    end
  end
end
