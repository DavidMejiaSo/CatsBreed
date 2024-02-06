class CatsInfo {
  final String? id;
  final String name;
  final String origin;
  final String temperament;
  final String description;
  final String lifeSpan;
  final String adaptability;
  final String affectionLevel;
  final String childFriendly;
  final String dogFriendly;
  final String energyLevel;
  final String grooming;
  final String healthIssues;
  final String intelligence;
  final String sheddingLevel;
  final String socialNeeds;
  final String strangerFriendly;
  final String vocalisation;
  final String hypoallergenic;
  final String weightImperial;
  final String weightMetric;

  CatsInfo({
    this.id,
    required this.name,
    required this.origin,
    required this.temperament,
    required this.description,
    required this.lifeSpan,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.intelligence,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.hypoallergenic,
    required this.weightImperial,
    required this.weightMetric,
  });

  CatsInfo copyWith({
    String? id,
    String? name,
    String? origin,
    String? temperament,
    String? description,
    String? lifeSpan,
    String? adaptability,
    String? affectionLevel,
    String? childFriendly,
    String? dogFriendly,
    String? energyLevel,
    String? grooming,
    String? healthIssues,
    String? intelligence,
    String? sheddingLevel,
    String? socialNeeds,
    String? strangerFriendly,
    String? vocalisation,
    String? hypoallergenic,
    String? weightImperial,
    String? weightMetric,
  }) {
    return CatsInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      origin: origin ?? this.origin,
      temperament: temperament ?? this.temperament,
      description: description ?? this.description,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      adaptability: adaptability ?? this.adaptability,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      childFriendly: childFriendly ?? this.childFriendly,
      dogFriendly: dogFriendly ?? this.dogFriendly,
      energyLevel: energyLevel ?? this.energyLevel,
      grooming: grooming ?? this.grooming,
      healthIssues: healthIssues ?? this.healthIssues,
      intelligence: intelligence ?? this.intelligence,
      sheddingLevel: sheddingLevel ?? this.sheddingLevel,
      socialNeeds: socialNeeds ?? this.socialNeeds,
      strangerFriendly: strangerFriendly ?? this.strangerFriendly,
      vocalisation: vocalisation ?? this.vocalisation,
      hypoallergenic: hypoallergenic ?? this.hypoallergenic,
      weightImperial: weightImperial ?? this.weightImperial,
      weightMetric: weightMetric ?? this.weightMetric,
    );
  }
}
