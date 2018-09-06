# == Schema Information
#
# Table name: routes
#
#  id         :bigint(8)        not null, primary key
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'byebug'
class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    buses = self.buses
    buses_drivers = buses.joins(:drivers).select("buses.id, drivers.name")
    all_drivers = Hash.new{|h,v| h[v] = []}
    buses_drivers.each do |bus_driver|
      all_drivers[bus_driver.id] << bus_driver.name
    end
    all_drivers
  end
end
