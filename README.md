# matportalen.no

matportalen.no ble lagt ned før jul 2023. Men matportalens URL-er lever videre
der ute i verden. Dette repoet inneholder en nginx-config og nok Terraform til å
få den opp å kjøre i GCP sånn at vi kan redirecte viktige URL-er som lå på
matportalen.no til deres nye hjem.

## Redirects

Tjenesten skal redirigere smilefjes-plakater til [den nye
tjenesten](https://github.com/mattilsynet/smilefjes-deux).

```sh
curl -i
https://smilefjes.matportalen.no/smilefjes/spisested/fredrikstad/mother_india.Z1006080424341261190QJKEF_Tilsynsobjekt

HTTP/1.1 301 Moved Permanently
Location: https://smilefjes.mattilsynet.no/spisested/fredrikstad/mother_india.Z1006080424341261190QJKEF
```

Andre forespørsler sendes til
[smilefjes.mattilsynet.no](https://smilefjes.mattilsynet.no) med opprinnelig sti
bak.

## Bygg

```sh
make docker
```

## Github Actions

Verdt å merke seg: prosjekt-id-en som brukes med `workload_identity_provider`
når vi autentiserer oss mot GCP for å oppdatere Cloud Run-konfigurasjonen vår
kan finnes på følgende vis:

```sh
gcloud projects list \
  --filter="matportalen-cafa" \
  --format="value(PROJECT_NUMBER)"
```

## Kontakt

Dersom du har spørsmål, tilbakemeldinger, eller har lyst til å få tak i oss av
en annen grunn kan du enten bruke issues/pull requests her på Github, eller
sende oss en epost på [team.mat@mattilsynet.no](mailto:team.mat@mattilsynet.no).
