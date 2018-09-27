class BandwidthPackage < ApplicationRecord
  belongs_to :network
  has_many :units
  
end
