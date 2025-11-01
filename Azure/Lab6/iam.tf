

data "azuread_client_config" "current" {}

resource "azuread_group" "remote_access_users" {
  display_name     = "${var.application_name}-${var.environment_name}-remote_access_users"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}

resource "azuread_group_member" "tunde_remote_access_membership" {
  group_object_id  = azuread_group.remote_access_users.object_id
  member_object_id = data.azuread_user.tunde.object_id
}

data "azuread_user" "tunde" {
  user_principal_name = "learningandcertifications_gmail.com#EXT#@ogkareemu.live"
}