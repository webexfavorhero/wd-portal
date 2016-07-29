class Upgrade < ActiveRecord::Base
  has_many :products
  
  # optional, but probably a good idea
  validates :pu_id, :uniqueness => true

  def self.save_data_from_api
    require 'ubersmithrb'
    api = Ubersmith::API.new(ENV['UBERSMITH_DOMAIN'], ENV['UBERSMITH_USERNAME'], ENV['UBERSMITH_PASSWORD'])
    result = api.uber.plan_upgrade_list({
      :exclude_empty  => 1,
      :all_options    => 1
    })
    unless result.error?
      upgrade_data = result.values
      upgrades = upgrade_data.map do |line|
        u = Upgrade.find_or_initialize_by(pu_id: line["pu_id"])
        u.pu_id         = line['pu_id']
        u.pu_status     = line['pu_status']
        u.pu_name       = line['pu_name']
        u.pug_name      = line['pug_name']
        u.pug_status    = line['pug_status']
        u.inv_hide      = line['inv_hide']
        u.plan_inv_hide = line['plan_inv_hide']
        u.pu_priority   = line['pu_priority']
        u.save
        u
      end
      upgrades.select(&:persisted?)
    end
  end
end
