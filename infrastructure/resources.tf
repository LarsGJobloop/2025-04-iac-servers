resource "hcloud_server" "toy_server" {
  name        = "toy-server"
  location    = "hel1"
  image       = "debian-12"
  server_type = "cax21"

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
