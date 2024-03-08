import 'package:flutter/material.dart';
import 'package:flutter_application_1/design_tools/tool_widgets/app_colors.dart';

import '../Infraestructure/entities/cat.dart';
import '../design_tools/tool_widgets/tool_widgets.dart';

class CatPage extends StatefulWidget {
  final Cat cat; // Agrega un parámetro para recibir el objeto Cat

  const CatPage({Key? key, required this.cat}) : super(key: key);

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(widget.cat.urlImage),
                          fit: BoxFit.cover),
                    ),

                    //Container , aquí se arma imagen y row

                    // height: MediaQuery.of(context).size.height * 1,
                    //width: MediaQuery.of(context).size.width * 1,

                    child: Center(
                        //---AQUÍ VA CONSUMER de data USER
                        child: Container(
                      color: AppColors.black.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              profilePhoto(
                                  widget.cat.urlImage, widget.cat.name),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: AppWidgets.mainText(
                                    context, widget.cat.name, 10,
                                    color: Colors.white),
                              ),
                              Expanded(
                                child: Container(
                                    //color: AppColors.black.withOpacity(0.5),
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 9, right: 9),
                                  child: SingleChildScrollView(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(), // Esto garantiza que la barra de desplazamiento siempre esté visible
                                      child: catInformationsCard(widget.cat)),
                                )),
                              )
                            ]),
                      ),
                    ))))));
  }

  Widget profilePhoto(String catImage, String catName) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: NetworkImage(catImage), fit: BoxFit.fitWidth),
      ),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 3.0), //margen entre container padre y columna

        child: Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: AppColors.black.withOpacity(0.1),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ),
        ),
      ),
    );
  }

  Widget catInformationsCard(Cat cat) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppWidgets.smallText(context, cat.description, 4,
              color: AppColors.white),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Origin:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(context, cat.origin, 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Life-span:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(context, cat.lifeSpan, 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Metric_weight:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(
                          context, cat.weightMetric.toString(), 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Imperial-weight:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(
                          context, cat.weightImperial.toString(), 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Affection_level:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(
                          context, cat.affectionLevel.toString(), 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Intelligence:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(
                          context, cat.intelligence.toString(), 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Child_friendly:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(
                          context, cat.childFriendly.toString(), 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Health_issues:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(
                          context, cat.healthIssues.toString(), 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Hypoallergenic:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(
                          context, cat.hypoallergenic.toString(), 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Grooming:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(context, cat.grooming, 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Shedding_lvl', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(context, cat.sheddingLevel, 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Temperament:', 4,
                          color: AppColors.white),
                      AppWidgets.elipsisText(context, cat.temperament, 2,
                          color: AppColors.white, maxCharacters: 28),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Vocalisation', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(context, cat.vocalisation, 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.mainText(context, 'Adaptability:', 4,
                          color: AppColors.white),
                      AppWidgets.smallText(context, cat.adaptability, 3.5,
                          color: AppColors.white),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.mainText(context, 'Energy_lvl', 4,
                        color: AppColors.white),
                    AppWidgets.smallText(context, cat.energyLevel, 3.5,
                        color: AppColors.white),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.mainText(context, 'Social_needs:', 4,
                        color: AppColors.white),
                    AppWidgets.smallText(context, cat.socialNeeds, 3.5,
                        color: AppColors.white),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
