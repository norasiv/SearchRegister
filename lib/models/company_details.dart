class CompanyDetails {
  final String navn;
  final String organisasjonsnummer;
  final String organisasjonsformBeskrivelse;
  final String hjemmeside;
  final Address forretningsadresse;
  final BusinessCode naeringskode1;

  CompanyDetails({
    required this.navn,
    required this.organisasjonsnummer,
    required this.organisasjonsformBeskrivelse,
    required this.hjemmeside,
    required this.forretningsadresse,
    required this.naeringskode1,
  });

  factory CompanyDetails.fromJson(Map<String, dynamic> json) {
    return CompanyDetails(
      navn: json['navn'] ?? '',
      organisasjonsnummer: json['organisasjonsnummer'] ?? '',
      organisasjonsformBeskrivelse: json['organisasjonsform']['beskrivelse'] ?? '',
      hjemmeside: json['hjemmeside'] ?? '',
      forretningsadresse: Address.fromJson(json['forretningsadresse'] ?? {}),
      naeringskode1: BusinessCode.fromJson(json['naeringskode1'] ?? {}),
    );
  }
}

class Address {
  final String land;
  final String postnummer;
  final String poststed;
  final String adresse;

  Address({
    required this.land,
    required this.postnummer,
    required this.poststed,
    required this.adresse,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      land: json['land'] ?? '',
      postnummer: json['postnummer'] ?? '',
      poststed: json['poststed'] ?? '',
      adresse: json['adresse'] ?? '',
    );
  }
}

class BusinessCode {
  final String kode;
  final String beskrivelse;

  BusinessCode({
    required this.kode,
    required this.beskrivelse,
  });

  factory BusinessCode.fromJson(Map<String, dynamic> json) {
    return BusinessCode(
      kode: json['kode'] ?? '',
      beskrivelse: json['beskrivelse'] ?? '',
    );
  }
}