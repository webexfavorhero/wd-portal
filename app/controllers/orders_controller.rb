class OrdersController < ApplicationController
  
  def index
    
    require 'ubersmithrb'
    
    api = Ubersmith::API.new(ENV['UBERSMITH_DOMAIN'], ENV['UBERSMITH_USERNAME'], ENV['UBERSMITH_PASSWORD'])
    result = api.uber.service_plan_list
    unless result.error?
      @services = result.values
    else
      @services = "Error"
    end
  end
  
  def show
    require "awesome_print"
    require 'ubersmithrb'
    
    api = Ubersmith::API.new(ENV['UBERSMITH_DOMAIN'], ENV['UBERSMITH_USERNAME'], ENV['UBERSMITH_PASSWORD'])
    plan = api.uber.service_plan_get({
      :plan_id => params[:id]
    })
    upgrades = api.uber.plan_upgrade_list({
      :plan_id        => params[:id],
      :exclude_empty  => 1,
      :all_options    => 1
    })
    unless upgrades.error? && plan.error?
      @upgrades = upgrades.values
      @plan = plan.data
    end
  end  
end
