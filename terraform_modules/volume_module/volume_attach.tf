resource "oci_core_volume_attachment" "data_volume_attachment" {
    #Required
    attachment_type = "iscsi"
    instance_id = var.instance_id
    volume_id = oci_core_volume.data_volume.id
    display_name = "data_volume_attachment"
     device = "/dev/oracleoci/oraclevdd"

    provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "10m"
      host        = var.host
      user        = var.user
      private_key = var.key
    }
    inline = [      
      "sudo iscsiadm -m node -o new -T ${self.iqn} -p ${self.ipv4}:${self.port}",
      "sudo iscsiadm -m node -o update -T ${self.iqn} -n node.startup -v automatic",
      "sudo iscsiadm -m node -T ${self.iqn} -p ${self.ipv4}:${self.port} -l",
    ]
  }       
}

resource "oci_core_volume_attachment" "fra_volume_attachment" {
    #Required
    attachment_type = "iscsi"
    instance_id = var.instance_id
    volume_id = oci_core_volume.fra_volume.id
    display_name = "fra_volume_attachment"
    device = "/dev/oracleoci/oraclevdf"

    provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "10m"
      host        = var.host
      user        = var.user
      private_key = var.key
    }
    inline = [      
      "sudo iscsiadm -m node -o new -T ${self.iqn} -p ${self.ipv4}:${self.port}",
      "sudo iscsiadm -m node -o update -T ${self.iqn} -n node.startup -v automatic",
      "sudo iscsiadm -m node -T ${self.iqn} -p ${self.ipv4}:${self.port} -l",
    ]
  }      
}

resource "oci_core_volume_attachment" "opt_volume_attachment" {
    #Required
    attachment_type = "iscsi"
    instance_id = var.instance_id
    volume_id = oci_core_volume.opt_volume.id
    display_name = "opt_volume_attachment"
    device = "/dev/oracleoci/oraclevdo"

    provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "10m"
      host        = var.host
      user        = var.user
      private_key = var.key
    }
    inline = [      
      "sudo iscsiadm -m node -o new -T ${self.iqn} -p ${self.ipv4}:${self.port}",
      "sudo iscsiadm -m node -o update -T ${self.iqn} -n node.startup -v automatic",
      "sudo iscsiadm -m node -T ${self.iqn} -p ${self.ipv4}:${self.port} -l",
    ]
  }      
}

resource "oci_core_volume_attachment" "backup_volume_attachment" {
    #Required
    attachment_type = "iscsi"
    instance_id = var.instance_id
    volume_id = oci_core_volume.backup_volume.id
    display_name = "backup_volume_attachment"
    device = "/dev/oracleoci/oraclevdb"

    provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "10m"
      host        = var.host
      user        = var.user
      private_key = var.key
    }
    inline = [      
      "sudo iscsiadm -m node -o new -T ${self.iqn} -p ${self.ipv4}:${self.port}",
      "sudo iscsiadm -m node -o update -T ${self.iqn} -n node.startup -v automatic",
      "sudo iscsiadm -m node -T ${self.iqn} -p ${self.ipv4}:${self.port} -l",
    ]
  }      
}

