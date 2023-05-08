class catsInformation {
  String? name;
  int? intelligence;
  String? origin;

  catsInformation({
    this.name = "",
    this.intelligence,
    this.origin = "",
  });
  catsInformation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    intelligence = json['intelligence'];
    origin = json['origin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['intelligence'] = intelligence;
    data['origin'] = origin;

    return data;
  }
}
