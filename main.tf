terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}



resource "docker_image" "grafana_image" {
  name = "grafana/grafana:latest"
}

resource "docker_container" "grafana_container" {
  name  = "grafana_container-${count.index}"
  image = docker_image.grafana_image.latest
  count = 2
}

# output "public_ip" {
#     value =  join("-", docker_container.grafana_container.*.name, docker_container.grafana_container.*.ip_address)
# }

output "public_ip" {
    value =  [for x in docker_container.grafana_container : "${x.name} - ${x.ip_address}"]
}