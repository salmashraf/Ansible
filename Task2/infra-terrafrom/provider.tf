provider "aws" {
  region = "us-east-1"
  shared_config_files = ["/home/salma/.aws/config"]
  shared_credentials_files = ["/home/salma/.aws/credentials"]
  profile                  = "dev-user"

}
