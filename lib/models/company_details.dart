class CompanyDetails {
  final String organisasjonsnummer;
  final String navn;
  final Organisasjonsform organisasjonsform;
  final String hjemmeside;
  final Postadresse postadresse;
  final String registreringsdatoEnhetsregisteret;
  final bool registrertIMvaregisteret;
  final List<String> frivilligMvaRegistrertBeskrivelser;
  final Naeringskode1 naeringskode1;
  final int antallAnsatte;
  final Forretningsadresse forretningsadresse;
  final String stiftelsesdato;
  final InstitusjonellSektorkode institusjonellSektorkode;
  final bool registrertIForetaksregisteret;
  final bool registrertIStiftelsesregisteret;
  final bool registrertIFrivillighetsregisteret;
  final String sisteInnsendteAarsregnskap;
  final bool konkurs;
  final bool underAvvikling;
  final bool underTvangsavviklingEllerTvangsopplosning;
  final String maalform;
  final Links links;

  CompanyDetails({
    required this.organisasjonsnummer,
    required this.navn,
    required this.organisasjonsform,
    required this.hjemmeside,
    required this.postadresse,
    required this.registreringsdatoEnhetsregisteret,
    required this.registrertIMvaregisteret,
    required this.frivilligMvaRegistrertBeskrivelser,
    required this.naeringskode1,
    required this.antallAnsatte,
    required this.forretningsadresse,
    required this.stiftelsesdato,
    required this.institusjonellSektorkode,
    required this.registrertIForetaksregisteret,
    required this.registrertIStiftelsesregisteret,
    required this.registrertIFrivillighetsregisteret,
    required this.sisteInnsendteAarsregnskap,
    required this.konkurs,
    required this.underAvvikling,
    required this.underTvangsavviklingEllerTvangsopplosning,
    required this.maalform,
    required this.links,
  });

  factory CompanyDetails.fromJson(Map<String, dynamic> json) {
    return CompanyDetails(
      organisasjonsnummer: json['organisasjonsnummer'] ?? '',
      navn: json['navn'] ?? '',
      organisasjonsform: Organisasjonsform.fromJson(json['organisasjonsform'] ?? {}),
      hjemmeside: json['hjemmeside'] ?? '',
      postadresse: Postadresse.fromJson(json['postadresse'] ?? {}),
      registreringsdatoEnhetsregisteret: json['registreringsdatoEnhetsregisteret'] ?? '',
      registrertIMvaregisteret: json['registrertIMvaregisteret'] ?? false,
      frivilligMvaRegistrertBeskrivelser: List<String>.from(json['frivilligMvaRegistrertBeskrivelser'] ?? []),
      naeringskode1: Naeringskode1.fromJson(json['naeringskode1'] ?? {}),
      antallAnsatte: json['antallAnsatte'] ?? 0,
      forretningsadresse: Forretningsadresse.fromJson(json['forretningsadresse'] ?? {}),
      stiftelsesdato: json['stiftelsesdato'] ?? '',
      institusjonellSektorkode: InstitusjonellSektorkode.fromJson(json['institusjonellSektorkode'] ?? {}),
      registrertIForetaksregisteret: json['registrertIForetaksregisteret'] ?? false,
      registrertIStiftelsesregisteret: json['registrertIStiftelsesregisteret'] ?? false,
      registrertIFrivillighetsregisteret: json['registrertIFrivillighetsregisteret'] ?? false,
      sisteInnsendteAarsregnskap: json['sisteInnsendteAarsregnskap'] ?? '',
      konkurs: json['konkurs'] ?? false,
      underAvvikling: json['underAvvikling'] ?? false,
      underTvangsavviklingEllerTvangsopplosning: json['underTvangsavviklingEllerTvangsopplosning'] ?? false,
      maalform: json['maalform'] ?? '',
      links: Links.fromJson(json['_links'] ?? {}),
    );
  }
}

class Organisasjonsform {
  final String kode;
  final String beskrivelse;
  final Links links;

  Organisasjonsform({
    required this.kode,
    required this.beskrivelse,
    required this.links,
  });

  factory Organisasjonsform.fromJson(Map<String, dynamic> json) {
    return Organisasjonsform(
      kode: json['kode'] ?? '',
      beskrivelse: json['beskrivelse'] ?? '',
      links: Links.fromJson(json['_links'] ?? {}),
    );
  }
}

class Postadresse {
  final String land;
  final String landkode;
  final String postnummer;
  final String poststed;
  final List<String> adresse;
  final String kommune;
  final String kommunenummer;

  Postadresse({
    required this.land,
    required this.landkode,
    required this.postnummer,
    required this.poststed,
    required this.adresse,
    required this.kommune,
    required this.kommunenummer,
  });

  factory Postadresse.fromJson(Map<String, dynamic> json) {
    return Postadresse(
      land: json['land'] ?? '',
      landkode: json['landkode'] ?? '',
      postnummer: json['postnummer'] ?? '',
      poststed: json['poststed'] ?? '',
      adresse: List<String>.from(json['adresse'] ?? []),
      kommune: json['kommune'] ?? '',
      kommunenummer: json['kommunenummer'] ?? '',
    );
  }
}

class Naeringskode1 {
  final String kode;
  final String beskrivelse;

  Naeringskode1({
    required this.kode,
    required this.beskrivelse,
  });

  factory Naeringskode1.fromJson(Map<String, dynamic> json) {
    return Naeringskode1(
      kode: json['kode'] ?? '',
      beskrivelse: json['beskrivelse'] ?? '',
    );
  }
}

class Forretningsadresse {
  final String land;
  final String landkode;
  final String postnummer;
  final String poststed;
  final List<String> adresse;
  final String kommune;
  final String kommunenummer;

  Forretningsadresse({
    required this.land,
    required this.landkode,
    required this.postnummer,
    required this.poststed,
    required this.adresse,
    required this.kommune,
    required this.kommunenummer,
  });

  factory Forretningsadresse.fromJson(Map<String, dynamic> json) {
    return Forretningsadresse(
      land: json['land'] ?? '',
      landkode: json['landkode'] ?? '',
      postnummer: json['postnummer'] ?? '',
      poststed: json['poststed'] ?? '',
      adresse: List<String>.from(json['adresse'] ?? []),
      kommune: json['kommune'] ?? '',
      kommunenummer: json['kommunenummer'] ?? '',
    );
  }
}

class InstitusjonellSektorkode {
  final String kode;
  final String beskrivelse;

  InstitusjonellSektorkode({
    required this.kode,
    required this.beskrivelse,
  });

  factory InstitusjonellSektorkode.fromJson(Map<String, dynamic> json) {
    return InstitusjonellSektorkode(
      kode: json['kode'] ?? '',
      beskrivelse: json['beskrivelse'] ?? '',
    );
  }
}

class Links {
  final Self self;

  Links({
    required this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: Self.fromJson(json['self'] ?? {}),
    );
  }
}

class Self {
  final String href;

  Self({
    required this.href,
  });

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json['href'] ?? '',
    );
  }
}
