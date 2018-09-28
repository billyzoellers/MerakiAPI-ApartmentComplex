class Unit < ApplicationRecord
  belongs_to :bandwidth_package
  has_many :switch_ports
  
  validates_format_of :mac_address, :with => /\A([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})\Z/, :message => "could not be found. Ask resident to connect their router and then try again."
  before_save :push_updates_to_meraki
  
  ransacker :my_sort do
    Arel.sql(
      "NULLIF(regexp_replace(varchar_column, '\D', '', 'g'), '')::int"
    )
  end
  
  def bandwidth_package_id=(value)
    check_for_mac_change
    
    super(value)
  end
  
  def bandwidth_package=(value)
    check_for_mac_change
    
    super(value)
  end
  
  private
  def check_for_mac_change
    # get active from switch
      macs = []
      switch_ports.each { |port|
        connected_macs = port.get_connected_mac
  
        connected_macs.each { |cmac|
          macs.push(cmac)
          
        }
      
      }
      
      # handle issues wrong number of MACs is detected
      if macs.count == 0
        update_attribute(:error, "MACNOTFOUND: MAC address not found on port")
      elsif macs.count == 1
        update_attribute(:error, nil)
        #attributes = {mac_address: macs.first}
        update_attribute(:mac_address, macs.first)
      else
        update_attribute(:error, "MACUPDATE: Too many MAC addresses")
      end

  end
  
  def push_updates_to_meraki
    if mac_address_changed?
      old_unit = Unit.find(id)
      # remove policy from old unit
      unless old_unit.mac_address.nil?
        bandwidth_package.remove_from_mac(old_unit.mac_address)
      end
      
    end

    bandwidth_package.apply_to_mac(mac_address)
  end
  
  
end
