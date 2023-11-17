terraform {
  required_version = ">=v1.3"
  required_providers {
     ibm = {
        source = "IBM-Cloud/ibm"
        version = ">=v1.12.0"
     }
   }
 }
# Configure the IBM Provider
provider "ibm" {
  region = "us-south"
}
# Create a VPC
resource "ibm_is_vpc" "testacc_vpc" {
  name = "test-vpc"
}