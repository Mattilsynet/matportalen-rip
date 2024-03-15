resource "google_dns_managed_zone" "matportalen_dns_zone" {
  name = "matportalen-dns-zone"
  dns_name = "matportalen.no."
  project = var.project_id
  description = "Matportalen"
  dnssec_config {
    state = "on"
  }
}

resource "google_dns_record_set" "matportalen" {
  name = "${resource.google_dns_managed_zone.matportalen_dns_zone.dns_name}"
  managed_zone = resource.google_dns_managed_zone.matportalen_dns_zone.name
  type = "A"
  ttl = 300
  project = var.project_id
  rrdatas = ["34.149.62.188"]
}

resource "google_dns_record_set" "matportalen-ipv6" {
  name = "${resource.google_dns_managed_zone.matportalen_dns_zone.dns_name}"
  managed_zone = resource.google_dns_managed_zone.matportalen_dns_zone.name
  type = "AAAA"
  ttl = 300
  project = var.project_id
  rrdatas = ["2600:1901:0:c02f::"]
}

resource "google_dns_record_set" "www-matportalen" {
  name = "www.${resource.google_dns_managed_zone.matportalen_dns_zone.dns_name}"
  managed_zone = resource.google_dns_managed_zone.matportalen_dns_zone.name
  type = "A"
  ttl = 300
  project = var.project_id
  rrdatas = ["34.149.62.188"]
}

resource "google_dns_record_set" "www-matportalen-ipv6" {
  name = "www.${resource.google_dns_managed_zone.matportalen_dns_zone.dns_name}"
  managed_zone = resource.google_dns_managed_zone.matportalen_dns_zone.name
  type = "AAAA"
  ttl = 300
  project = var.project_id
  rrdatas = ["2600:1901:0:c02f::"]
}

resource "google_dns_record_set" "smilefjes-matportalen" {
  name = "smilefjes.${resource.google_dns_managed_zone.matportalen_dns_zone.dns_name}"
  managed_zone = resource.google_dns_managed_zone.matportalen_dns_zone.name
  type = "A"
  ttl = 300
  project = var.project_id
  rrdatas = ["34.149.62.188"]
}

resource "google_dns_record_set" "smilefjes-matportalen-ipv6" {
  name = "smilefjes.${resource.google_dns_managed_zone.matportalen_dns_zone.dns_name}"
  managed_zone = resource.google_dns_managed_zone.matportalen_dns_zone.name
  type = "AAAA"
  ttl = 300
  project = var.project_id
  rrdatas = ["2600:1901:0:c02f::"]
}

resource "google_dns_record_set" "empty_spf1_txt_record" {
  name = "${resource.google_dns_managed_zone.matportalen_dns_zone.dns_name}"
  type = "TXT"
  ttl = 300
  project = var.project_id
  managed_zone = resource.google_dns_managed_zone.matportalen_dns_zone.name
  rrdatas = ["\"v=spf1\" \"-all\""]
}
