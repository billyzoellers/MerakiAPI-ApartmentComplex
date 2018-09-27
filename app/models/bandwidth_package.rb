class BandwidthPackage < ApplicationRecord
  belongs_to :network
  has_many :units
  
  def apply_to_mac(mac_address)
    # API call
    headers = {
      'X-Cisco-Meraki-API-Key' => network.api_key,
      'Content-Type' => 'application/json'
    }
    body = {
      devicePolicy: "group",
      groupPolicyId: group_policy_id
    }
        
    response = HTTParty.put( "https://dashboard.meraki.com/api/v0/networks/#{network.network_id}/clients/#{mac_address}/policy?timespan=2592000", :headers => headers, :body => body.to_json)
    
    # error
    if response.code != 200
      return false
        
    end
    
    return true
  end
  
  def remove_from_mac(mac_address)
    # API call
    headers = {
      'X-Cisco-Meraki-API-Key' => network.api_key,
      'Content-Type' => 'application/json'
    }
    body = {
      devicePolicy: "normal",
    }
        
    response = HTTParty.put( "https://dashboard.meraki.com/api/v0/networks/#{network.network_id}/clients/#{mac_address}/policy?timespan=2592000", :headers => headers, :body => body.to_json)
    
    # error
    if response.code != 200
      return false
        
    end
    
    return true
  end
  
end