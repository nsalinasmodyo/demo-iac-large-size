terraform {
    backend "s3" {
        profile = "dev"
        bucket =  "nsalinas"
        key = "status"
        region = "us-east-1"
        # encrypt = true
        # kms_key_id = "arn:aws:kms:us-east-1:629051236525:key/3b2df4f3-a238-49db-bad0-87afed5e04b6"
    }
}