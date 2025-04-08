output "toy_server_info" {
  description = "Valuable server info"
  value = {
    ipv4_address = hcloud_server.toy_server.ipv4_address
    ipv6_address = hcloud_server.toy_server.ipv6_address
  }
}
