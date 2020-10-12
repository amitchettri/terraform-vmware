provider "vsphere" {
  user = var.vsphere_user
  password = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Datacenter1"
}

data "vsphere_datastore" "datastore" {
  name          = "datastore1"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "cluster1/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "public"
  datacenter_id = data.vsphere_datacenter.dc.id
}

output "data_center" {
  value = data.vsphere_datacenter.dc
}

output "data_center_id" {
  value = data.vsphere_datacenter.dc.id
}
