class Unit < ApplicationRecord
  belongs_to :bandwidth_package
  has_many :switch_ports
end
