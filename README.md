# MerakiAPI-ApartmentComplex

## Summary
This web app provides a simplified interface for tenant internet connection management.

## How to use
Login to the UI to view a list of apartment units and their associated bandwidth packages.
### Edit
Use this to change the bandwidth package per apartment. Each time the save button is pressed (even if no package change) it will discover the MAC connected to the port, remove policy from an 'old' MAC, and add policy to the 'new' MAC
### Troubleshoot
Use this interface to find obvious issues. Will display the assigned switch port, detected MAC, and will alert if a MAC is not found, or too many MACs are found

## Getting Started
1. Create a 'Network' object
```
n = Network.new
n.name = "Apartment Complex Name"
n.api_key = "<meraki-api-key>"
n.network_id = "<network_id-from-meraki-api>"
n.save
```
2. Create 'Switch' objects for any switches that will connect directly to an endpoint
- You MUST tag any endpoint facing ports as 'resident' and 'apartment-XXX'
- 'Units' will be created automatically based on the tag when ports are downloaded from the API
```
s = Switch.new
s.network = n
s.serial = "<meraki-device-serial>"
s.save
s.get_switch_name
s.download_ports
```

3. Create bandwidth packages in the Meraki Dashboard
- These will be Meraki dashboard group policies with any relevant settings (generally bandwidth settings)
```
bp = BandwidthPackage.new
bp.name
bp.network = n // needed since group policy ID's may differ per network
bp.group_policy_id = <id-of-group-policy-from-meraki-api>
bp.display_order = <numerical-ordering-for-ui>
bp.save
```

## Areas for Improvement
- **Meraki API requests** are performed by the controller, so the UI waits for the Meraki API. This generally works OK in practice, but running them async would be better.
- **Administrative interface** does not exist. To create/delete/manage API (tag/switchport) to 'Apartment' mappings the rails console must be used
- **Setup process** can be automated within an administrative interface - would be ideal to be able to pull all data based on only an API key
- **Sorting by number in the UI** needs to be implemented to sort correctly in Ransack
- **Troubleshooting interface** can be improved to include things like - current port speed, cable testing (if implemented in API), resetting port, changing speed/duplex
- **Manual MAC configuration** could allow a single MAC to be selected per apartment to avoid situations where speed increases can not be processed due to multiple devices
- **Public IP management** allow for a separate VLAN that would assign public IPs directly
- **Internet shutdown** allow an option to place drop devices into a separate "disabled" VLAN (w/ splash page)
- **Improve group policy assignment logic** check the current policy before trying to save a new one (i.e. stop doing operations that are already done)