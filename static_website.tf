module "static-site" {
  source            = "telia-oss/static-site/aws"
  version           = "3.0.0"
  bucket_versioning = false
  hosted_zone_name  = "thecloudcollege.com"
  name_prefix       = "stwe001"
  site_name         = "stwe001.thecloudcollege.com"
}
