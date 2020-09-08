
    
      variable "compartment_ocid" {}
      variable "tenancy_ocid" {}
      variable "region" {}
      
      variable "instance_display_name" {}
      variable "shape" {}
      variable "assign_public_ip" {}
      variable "vnic_name" {}
      variable "hostname_label" {}
      variable "subnet_ocid" {}
      variable "ssh_public_key" {}
      variable "instance_timeout" {}
      variable "attachment_type" {}
      variable "use_chap" {}
      variable "resource_platform" {}
	  variable "NumInstances" {default = "1"}
      
      provider "oci" {
        tenancy_ocid     = var.tenancy_ocid
        region           = var.region
        version          = 3.66
      }
    