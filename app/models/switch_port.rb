class SwitchPort < ApplicationRecord
  belongs_to :unit
  belongs_to :switch
  
  def get_connected_mac
    # API call
    headers = {
                'X-Cisco-Meraki-API-Key' => switch.network.api_key,
                'Content-Type' => 'application/json'
            }
            
    response = HTTParty.get( "https://dashboard.meraki.com/api/v0/devices/#{switch.serial}/clients?timespan=3600", :headers => headers)
    
    # error
    if response.code != 200
        return nil
        
    end
    
    hash = JSON.parse(response.body)
    
    # process each client from the API
    macs = []
    hash.each { |mac|
        # filter to this port only
        if mac['switchport'] == number.to_s
          macs.push(mac['mac'])
            
        end
    }
    
    return macs
  end
  
end