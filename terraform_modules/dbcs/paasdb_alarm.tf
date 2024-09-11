data "oci_ons_notification_topics" "cg_notification_topics" {
    #Required
    compartment_id = var.compartment_id
}

module "db_alarms"{

  source = "../alarms/db/dbcs_alarms"


  cpu_alarm = true
  storage_alarm = true
  session_alarm = true

  database_id = module.my_primary_paas_db.dbcs_db_id
  topic_id = "ocid1.onstopic.oc1.eu-frankfurt-1.aaaaaaaam2esvahvwiz4wyhjwvjkec2iszgvoopntxkfu576fiy2xe74aloa"
  compartment_id = var.compartment_id
}

