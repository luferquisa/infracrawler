

	
	
      terraform {
        required_version = ">= 0.12.0"
      }

      data "oci_core_subnet" "this" {
        subnet_id = var.subnet_ocid
      }

      data "oci_core_images" "this" {
        #Required
        compartment_id = "${var.compartment_ocid}"
  
        #Optional
        shape = "VM.Standard.E2.1.Micro"
        state = "AVAILABLE"
      }

      # add data source to list AD1 name in the tenancy. Should work for both single and multi Ad region 
      data "oci_identity_availability_domain" "ad" {
          compartment_id = "${var.tenancy_ocid}"
          ad_number      = 1
      }
  
      resource "oci_core_instance" "this" {
        # availability_domain  = data.oci_core_subnet.this.availability_domain
        availability_domain  = "${data.oci_core_subnet.this.availability_domain != null ? data.oci_core_subnet.this.availability_domain : data.oci_identity_availability_domain.ad.name}"
		count = "${var.NumInstances}"
        compartment_id       = var.compartment_ocid
        display_name         = "${var.instance_display_name}${count.index}"
        #ipxe_script          = var.ipxe_script
        preserve_boot_volume = false
        shape                = var.shape

        create_vnic_details {
          assign_public_ip       = var.assign_public_ip
          display_name           = var.vnic_name
          hostname_label         = var.hostname_label
          subnet_id              = var.subnet_ocid
        }

        metadata = {
          ssh_authorized_keys = var.ssh_public_key
          user_data          =  "${base64encode(file("./inicio.sh"))}"
        }

        source_details {
          #boot_volume_size_in_gbs = 20
          source_type = "image"
          source_id   = "ocid1.image.oc1.us-sanjose-1.aaaaaaaalhkgtufp7v7hom6nbzydswbzesww5jha2bmjfyc2soq57y6zsnoq"
        }

        timeouts {
          create = var.instance_timeout
        }
      }

      