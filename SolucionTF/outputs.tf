
    
      output "instance_name" {
        description = "ocid of created instances. "
        value       = [oci_core_instance.this.*.display_name]
      }
      
      output "public_ip" {
        description = "Public IPs of created instances. "
        value       = [oci_core_instance.this.*.public_ip]
      }
	  