import '../entities/cat.dart';

class CatMapper {
  static List<Cat> jsonToEntityList(List<dynamic> jsonDataList) {
    //Mapper de datos
    List<Cat> catsList = [];
    String urlImage = 'https://cdn2.thecatapi.com/images/';

    for (var jsonData in jsonDataList) {
      String id = jsonData['id'];
      String name = jsonData['name'];
      String origin = jsonData['origin'];
      String image =
          '${urlImage}${jsonData['reference_image_id']}.jpg'; //Iamgen de los gatitos
      String temperament = jsonData['temperament'];
      String description = jsonData['description'];
      String lifeSpan = jsonData['life_span'];
      String adaptability = jsonData['adaptability'].toString();
      String affectionLevel = jsonData['affection_level'].toString();
      String childFriendly = jsonData['child_friendly'].toString();
      String dogFriendly = jsonData['dog_friendly'].toString();
      String energyLevel = jsonData['energy_level'].toString();
      String grooming = jsonData['grooming'].toString();
      String healthIssues = jsonData['health_issues'].toString();
      String intelligence = jsonData['intelligence'].toString();
      String sheddingLevel = jsonData['shedding_level'].toString();
      String socialNeeds = jsonData['social_needs'].toString();
      String strangerFriendly = jsonData['stranger_friendly'].toString();
      String vocalisation = jsonData['vocalisation'].toString();
      String hypoallergenic = jsonData['hypoallergenic'].toString();
      String weightImperial = jsonData['weight']['imperial'];
      String weightMetric = jsonData['weight']['metric'];

      Cat cat = Cat(
        id: id,
        name: name,
        urlImage: image,
        origin: origin,
        temperament: temperament,
        description: description,
        lifeSpan: lifeSpan,
        adaptability: adaptability,
        affectionLevel: affectionLevel,
        childFriendly: childFriendly,
        dogFriendly: dogFriendly,
        energyLevel: energyLevel,
        grooming: grooming,
        healthIssues: healthIssues,
        intelligence: intelligence,
        sheddingLevel: sheddingLevel,
        socialNeeds: socialNeeds,
        strangerFriendly: strangerFriendly,
        vocalisation: vocalisation,
        hypoallergenic: hypoallergenic,
        weightImperial: weightImperial,
        weightMetric: weightMetric,
      );

      catsList.add(cat);
    }

    return catsList;
  }
}
