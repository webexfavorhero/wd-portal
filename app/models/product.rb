class Product < ActiveRecord::Base
  has_many :order_items
  has_many :upgrades

  default_scope { where(active: true) }
  
  def to_param
    plan_id.to_s
  end
  
  # optional, but probably a good idea
  validates :plan_id, :uniqueness => true
  serialize :upgrades
  
  def self.save_data_from_api
    require 'ubersmithrb'
    api = Ubersmith::API.new(ENV['UBERSMITH_DOMAIN'], ENV['UBERSMITH_USERNAME'], ENV['UBERSMITH_PASSWORD'])
    result = api.uber.service_plan_list
    unless result.error?
      product_data = result.values
      products = product_data.map do |line|
        p = Product.find_or_initialize_by(plan_id: line["plan_id"])
        p.plan_id  = line['plan_id']
        p.name     = line['title']
        p.price    = line['price']
        p.stock    = line['quantity']
        #p.upgrades = line['upgrades']
        p.save
        p
      end
      products.select(&:persisted?)
    end
  end
end