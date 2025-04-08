resource "hcloud_ssh_key" "toy_server_ssh_key" {
  name       = "toy_server_ssh_key"
  public_key = file("./.server-demo-key.pub")
}

resource "hcloud_server" "toy_server" {
  name        = "toy-server"
  location    = "hel1"
  image       = "debian-12"
  server_type = "cax21"

  ssh_keys = [hcloud_ssh_key.toy_server_ssh_key.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
