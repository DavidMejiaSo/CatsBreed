import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/cats_list_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../design_tools/tool_widgets/tool_widgets.dart';

class CatsPage extends ConsumerStatefulWidget {
  const CatsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CatsPageState();
}

class _CatsPageState extends ConsumerState<CatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer(
            builder: (context, ref, child) {
              final catsData = ref.watch(catsProvider).allCats; //-->lISTADO
              return Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://img.freepik.com/vector-premium/patron-costuras-huella-pata-huesos-sobre-fondo-marron-huella-animal-ilustracion-vectorial_648830-158.jpg"),
                )),
                height: MediaQuery.of(context).size.height * 0.95,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: catsData.length,
                  itemBuilder: (context, index) {
                    final cat = catsData[index];
                    final idCat = cat.id.toString();
                    final nameCat = cat.name;
                    final originCat = cat.origin;
                    final temperamentCat = cat.temperament;
                    final descriptionCat = cat.description;
                    final lifeSpanCat = cat.lifeSpan;
                    final adaptabilityCat = cat.adaptability;
                    final affectionLevelCat = cat.affectionLevel;
                    final childFriendlyCat = cat.childFriendly;
                    final dogFriendlyCat = cat.dogFriendly;
                    final energyLevelCat = cat.energyLevel;
                    final groomingCat = cat.grooming;
                    final healthIssuesCat = cat.healthIssues;
                    final intelligenceCat = cat.intelligence;
                    final sheddingLevelCat = cat.sheddingLevel;
                    final socialNeedsCat = cat.socialNeeds;
                    final strangerFriendCat = cat.strangerFriendly;
                    final vocalisationCat = cat.vocalisation;
                    final hypoallergenicCat = cat.hypoallergenic;
                    final weightImperialCat = cat.weightImperial;
                    final weightMetricCat = cat.weightMetric;

                    return catInfoCard(
                      id: idCat,
                      name: nameCat,
                      origin: originCat,
                      temperament: temperamentCat,
                      description: descriptionCat,
                      lifeSpan: lifeSpanCat,
                      adaptability: adaptabilityCat,
                      affectionLevel: affectionLevelCat,
                      childFriendly: childFriendlyCat,
                      dogFriendly: dogFriendlyCat,
                      energyLevel: energyLevelCat,
                      grooming: groomingCat,
                      healthIssues: healthIssuesCat,
                      intelligence: intelligenceCat,
                      sheddingLevel: sheddingLevelCat,
                      socialNeeds: socialNeedsCat,
                      strangerFriendl: strangerFriendCat,
                      vocalisation: vocalisationCat,
                      hypoallergenic: hypoallergenicCat,
                      weightImperial: weightImperialCat,
                      weightMetric: weightMetricCat,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget catInfoCard({
    required String id,
    required String name,
    required String origin,
    required String temperament,
    required String description,
    required String lifeSpan,
    required String adaptability,
    required String affectionLevel,
    required String childFriendly,
    required String dogFriendly,
    required String energyLevel,
    required String grooming,
    required String healthIssues,
    required String intelligence,
    required String sheddingLevel,
    required String socialNeeds,
    required String strangerFriendl,
    required String vocalisation,
    required String hypoallergenic,
    required String weightImperial,
    required String weightMetric,
  }) {
    //Card que contiene la info de cada gato
    return AppWidgets.customCard(
        containerHeight: MediaQuery.of(context).size.height * 0.74,
        containerWidth: MediaQuery.of(context).size.width * 0.8,
        customDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // Borde del contenedor
          border: Border.all(
            color: Colors.red, // Color del borde
            width: 6.0, // Ancho del borde
          ),
        ),
        topLeftRadius: 30,
        topRightRadius: 30,
        bottomLeftRadius: 30,
        bottomRightRadius: 30,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            // width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        //Aquí va el listado de textos
                        height: MediaQuery.of(context).size.height * 0.3,
                        //width: MediaQuery.of(context).size.width * 0.2,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AppWidgets.mainText(
                                    context, 'Name: $name', 3),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AppWidgets.mainText(
                                    context, 'Origen:$origin', 3),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AppWidgets.mainText(
                                    context, 'Longevidad:$lifeSpan', 3),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AppWidgets.mainText(
                                    context, 'Adaptabilidad:$adaptability', 3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //Aquí va la card con foto de gato, pesos y  medida
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.2,

                        child: Column(
                          children: [
                            AppWidgets.customCard(
                              containerHeight:
                                  MediaQuery.of(context).size.height * 0.1,
                              containerWidth:
                                  MediaQuery.of(context).size.width * 0.2,
                              child: Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://cdn4.iconfinder.com/data/icons/animals-57/500/cat_animal_-512.png")))),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AppWidgets.mainText(
                                    context, 'Peso:$weightImperial', 3),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: AppWidgets.mainText(
                                    context, 'Longevidad:$weightMetric', 3),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                //_------------------------------------------------------------------------

                Expanded(
                  child: Container(
                    //Este obtendrá la info adicional
                    height: MediaQuery.of(context).size.height * 0.4,
                    // width: MediaQuery.of(context).size.width * 0.8,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AppWidgets.mainText(
                              context, 'Decripción:$description', 3),
                        ),
                        Expanded(
                            child: AppWidgets.smallText(
                                context, 'Longevidad:$lifeSpan', 3)),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AppWidgets.mainText(
                                    context, 'Hypoalergico:$hypoallergenic', 3),
                              ),
                              Expanded(
                                  child: AppWidgets.mainText(
                                      context, 'Amigable:$childFriendly', 3)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AppWidgets.mainText(
                                    context, 'Inteligencia:$intelligence', 3),
                              ),
                              Expanded(
                                  child: AppWidgets.mainText(
                                      context, 'Energía:$energyLevel', 3)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AppWidgets.mainText(
                                    context, 'Enfermedades:$healthIssues', 3),
                              ),
                              Expanded(
                                  child: AppWidgets.mainText(
                                      context, 'Temperamento:$temperament', 3)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: AppWidgets.mainText(
                                    context, 'Aseo:$grooming', 3),
                              ),
                              Expanded(
                                  child: AppWidgets.mainText(context, '', 3)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}


//catInfoCard(
//                    id: idCat,
//                    name: nameCat,
//                    origin: originCat,
//                    temperament: temperamentCat,
//                    description: descriptionCat,
//                    lifeSpan: lifeSpanCat,
//                    adaptability: adaptabilityCat,
//                    affectionLevel: affectionLevelCat,
//                    childFriendly: childFriendlyCat,
//                    dogFriendly: dogFriendlyCat,
//                    energyLevel: energyLevelCat,
//                    grooming: groomingCat,
//                    healthIssues: healthIssuesCat,
//                    intelligence: intelligenceCat,
//                    sheddingLevel: sheddingLevelCat,
//                    socialNeeds: socialNeedsCat,
//                    strangerFriendl: strangerFriendCat,
//                    vocalisation: vocalisationCat,
//                    hypoallergenic: hypoallergenicCat,
//                    weightImperial: weightImperialCat,
//                    weightMetric: weightMetricCat,
//                  );