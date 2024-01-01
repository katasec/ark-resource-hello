

data "local_file" "network_json" {
  filename = "${path.module}/configdata.json" // Replace with your file path
}

locals {
  network_data = jsondecode(data.local_file.network_json.content)
}

# Accessing the decoded JSON data
output "hub_name" {
  value = local.network_data.Hub.Name
}

output "spokes" {
  value = [
    for spoke in local.network_data.Spokes : {
      Name           = spoke.Name
      AddressPrefix  = spoke.AddressPrefix
    }
  ]
}
