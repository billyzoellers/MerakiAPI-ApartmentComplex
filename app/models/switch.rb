class Switch < ApplicationRecord
  belongs_to :network
  has_many :switch_ports
  
    # pull switchports on this device from the Meraki API
    def download_ports
    
        # API call
        headers = {
                'X-Cisco-Meraki-API-Key' => network.api_key,
                'Content-Type' => 'application/json'
        }
            
        response = HTTParty.get( "https://dashboard.meraki.com/api/v0/devices/#{serial}/switchPorts", :headers => headers)
        
        # error
        if response.code != 200
            return nil
            
        end
        
        hash = JSON.parse(response.body)
        
        # process each port pulled from the API
        hash.each { |port|
            # only process ports tagged in Meraki for a resident
            if port['tags'] && port['tags'].include?('resident')
                
                # get apartment number from port name
                apt_num = port['name'].split('-')[1]
                
                # add port to rails model
                SwitchPort.find_or_create_by(
                    number: port['number'],
                    is_managed: true,
                    unit: Unit.find_or_create_by(name: apt_num),
                    switch: self
                )
                
            end
        }
        
        return true
    end
    
    def get_switch_name
        
        # API call
        headers = {
                'X-Cisco-Meraki-API-Key' => network.api_key,
                'Content-Type' => 'application/json'
        }
            
        response = HTTParty.get( "https://dashboard.meraki.com/api/v0/networks/#{network.network_id}/devices/#{serial}", :headers => headers)
        
        # error
        if response.code != 200
            return nil
            
        end
        
        hash = JSON.parse(response.body)
        
        update_attribute(:name, h['name'])
    end
    
end
