resource "aws_dynamodb_table" "basic-dyanmo-table" {
 name = "${var.env}-infra-apps"
 billing_mode = "PAY_PER_REQUEST"

 hash_key = var.hash_key
 attribute {
   name = var.hash_key
   type = "S"  # String data type
 }

 tags = {
   Name = var.hash_key
 }
}