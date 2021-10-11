# Webapp og infrastruktur med React, Terraform og Open Source moduler

I denne øvingen skal du øve på 

* Mer avansert Github actions. For eksempel ; Flere jobber og avhengigheter mellom jobber
* Terraform i Pipeline - Terraform skal nå kjøres av GitHub actions
* AWS - Hvordan bruke en open source modul til å spare masse tid, og publisere ne React.js webapp 


## Legg til Github repository secrets   

* Lag en fork av dette repoet 
* Sjekk ut din fork
* Legg til "repository secrets", verdier gis i klasserommet. Dette gjorde vi i øving 5. Hvis du trenger repetisjon, sjekk her; <https://github.com/PGR301-2021/05-cd-apprunner-with-docker#gi-github-actions-tilgang-til-n%C3%B8kler>

## Sjekk tillgang til Cloud 9 miøjøet ditt.

* I klasserommet får du tilgang til et Cloud9 miljø. Sørg for at du har tilgang til dette
* kjør git clone *av din egen fork* fra Cloud9.

## Oppgave 1

I provider.tf har vi en Backend for Terraform sin state basert på S3. 

### Husk

* State - mekanismen som Terraform bruker for koble infra-kode til faktisk infrastruktur 
* Backend. En lagringsplass for state filen. Hvis du ikke har noen backend konfigurasjon får du en .tfstate fil på maskinen din.

I denne filen må må du endre på stien til terraform state filen, og bruke ditt unike filnavn, for eksempel min (glenn)

```hcl
  backend "s3" {
    bucket = "pgr301-2021-terraform-state"
    key    = "glennbech/terraform-in-pipeline.state"
    region = "eu-north-1"
  }
```
## Oppgave 2

Lag en variables.tf i rotkatalogen, og fjern hardkodingen av "glenn" i static_website.tf filen. Det er ikke god praksis å hardkode
verdier ("glenn") på denne måten. 

Legg også spesielt merke til hvordan vi referer til moduler på en veldig "kort form" når de finnes i Terraform registry (https://registry.terraform.io/)

```hcl
module "static-site" {
    source  = "telia-oss/static-site/aws"
    version = "3.0.0"
    
    hosted_zone_name = "thecloudcollege.com"
    name_prefix      = "glenn"
    site_name        = "glenn.thecloudcollege.com"
}
```

## Oppgave 3 



