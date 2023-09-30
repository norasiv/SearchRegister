class Entity {
  final List<EntityData> entities;

  Entity({
    required this.entities,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    final List<dynamic> entityDataList = json['_embedded']['enheter'];
    final List<EntityData> entities = entityDataList.map((entityData) {
      final String name = entityData['navn'] ?? 'Name not found';
      final String organisasjonsnummer =
          entityData['organisasjonsnummer'] ?? 'Organisasjonsnummer not found';
      return EntityData(name: name, organisasjonsnummer: organisasjonsnummer);
    }).toList();

    return Entity(entities: entities);
  }
}

class EntityData {
  final String name;
  final String organisasjonsnummer;

  EntityData({
    required this.name,
    required this.organisasjonsnummer,
  });
}
