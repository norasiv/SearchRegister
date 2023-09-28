class Entity {
  final String name;
  final String organisasjonsnummer;

  Entity({
    required this.name,
    required this.organisasjonsnummer,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> entityData = json['_embedded']['enheter'][0];
    return Entity(
      name: entityData['navn'] ?? 'Name not found',
      organisasjonsnummer: entityData['organisasjonsnummer'] ?? 'Organisasjonsnummer not found',
    );
  }
}