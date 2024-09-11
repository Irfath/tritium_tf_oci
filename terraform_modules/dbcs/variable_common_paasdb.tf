
variable "compartment_id"{
	default = "ocid1.compartment.oc1..aaaaaaaarpndojinoeuexw3l7eav3bdkwcc263tozzixxm74qcrptqfglnva"
}


variable "db_name" {
	default="uatdb"
}

variable "db_version" {
	default="19.17.0.0"
}

variable "database_edition" {
	type = map(string)

	  default = {
	    EE = "ENTERPRISE_EDITION"
	    EE_XP  = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
            EE_HP = "ENTERPRISE_EDITION_HIGH_PERFORMANCE"
	    SE = "STANDARD_EDITION" 	
	  }

}

variable "license_model" {
	type    = map(string)
	default = {
		LINC="LICENSE_INCLUDED"
		BYOL ="BRING_YOUR_OWN_LICENSE"
	}
}


variable "pdb_name" {
        default="dauat"
}

data "oci_secrets_secretbundle" "admin-passwd" {
  secret_id = "ocid1.vaultsecret.oc1.uk-london-1.amaaaaaaj2m4spiajfpka5gd4jgmwnlcpj4h77qi4pscwnomnfngm5yohqja"
}

# data "oci_vault_secrets" "admin-passwd" {
#     #Required
#     compartment_id = var.compartment_id

#     #Optional
#     name = "admin_password"
#     #state = var.secret_state
#     vault_id = "ocid1.vault.oc1.uk-london-1.cfr2fozgaadow.abwgiljtjosmne7uo2iuypua3tfe4ogloysroafuiabhdz53qh37fzmoxdoq"
# }

variable "public_key" {
        default =["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDB+K2mbLSHBNtzeB3PxModMe1paQd6dw275Ub67OkebzfxsBgpHfNpVUrFm7dI1+oJ5thcmQn0d4skAXgW0E5yk28wTFZ7lpIK1docBa0kPGFu7UH2nq9/EFPHjazy3SM5laqduNlFMVoVDJ2bygIQj/4kMNUxwdk8yYlm0AvsmS51C7e4K5iV/WwjZkqgmSzUkinkwncONsDgSK8wgyK/o3o5WBntHKOoZJigYpz9pNQZcOXOR2EuyFCJCJwRCkKDN42OI1CQGvqTGOD8D1SLcEyDtf0b1DsNy6ZItpFHeFeAcNuXzW8i1gal8zbq5xqTnyVA3/VruViLh1ollZq1A4FNFLEzHwjb0y4IjjPbj0CAbqBy2qUkNihC48MYKX0c/lF14uudjXo326oL6TnPF30/XTE4OqtY+98JBWaWihFikMoI4Ubd6Ysi7w6V4O68pEsUA6ieFPVE0n66UTkAivMTglzSsRd4r0pDxgIA18Sl2pVeJQEt9nvHN+HBKRzgvDQQSZRCXRxavmcIq7DeJDCJPZkS97bhj7WMUgl/R8KeZ2vr10uAZmhWAKO3ejxO9FLEdUKWUi9Z5yNOvleA7e/f55CuqCC+iEO7G8X36t6k6J+YHjI6hf9HnWPXe/6pRWqBTmQOVy2RZHdL01QF70TnexUxOLJbab5usknrVQ== computekey"]
}

variable "admin_password" {
	default="m1hQzr943ms4a4_#Z9"
	sensitive = true
}

variable "wallet_password" {
        default="m1h07Y634a4_#Z9"
        sensitive = true
}


variable "storage_management"{
	type=map(string)
	default={
		ASM="ASM"
		LVM="LVM"
	}
}

variable "db_time_zone" {
	default="Asia/Dubai"
}
# variable "codegen_vpn_drg_id"{
# 	default="ocid1.drg.oc1.eu-frankfurt-1.aaaaaaaamy6bpznpzuco46m3rgqrvss6qi46rklp4fv4u7q7yaxdszhmbzuq"	
# }