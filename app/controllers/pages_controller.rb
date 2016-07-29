class PagesController < ApplicationController
  
  def index
    
    require 'ubersmithrb'
    
    api = Ubersmith::API.new(ENV['UBERSMITH_DOMAIN'], ENV['UBERSMITH_USERNAME'], ENV['UBERSMITH_PASSWORD'])
    result = api.client.list({
      :inactive => 0,
      :active   => 1
    })
    unless result.error?
      @clients = result.values
    else
      @clients = "Error"
    end
  end
end