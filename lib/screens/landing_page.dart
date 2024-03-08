import 'package:flutter/material.dart';
import 'package:flutter_application_1/Infraestructure/entities/cat.dart';
import 'package:flutter_application_1/design_tools/tool_widgets/app_colors.dart';
import 'package:flutter_application_1/design_tools/tool_widgets/necesary_images.dart';

import 'package:flutter_application_1/providers/search_cat_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../design_tools/tool_widgets/tool_widgets.dart';
import 'cat_page.dart';

class CatsPage extends ConsumerStatefulWidget {
  const CatsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CatsPageState();
}

class _CatsPageState extends ConsumerState<CatsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Consumer(builder: (context, ref, child) {
              final catsData = ref.watch(searchCatsProvider); //-->lISTADO
              return Container(
                decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.5),
                    image: DecorationImage(
                      opacity: 0.2,
                      fit: BoxFit.cover,
                      image: NetworkImage(NecessaryImages.backgroundImage),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: catsData.length,
                    itemBuilder: (context, index) {
                      final cat = catsData[index];

                      return catInfoCard(cat: cat);
                    },
                  ),
                ),
              );
            }),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(child: _searchProduct()),
            ),
          ],
        ),
      ),
    );
  }

  Widget catInfoCard({
    required Cat cat,
  }) {
    //Card que contiene la info de cada gato
    return GestureDetector(
      onTap: () {
        ref.invalidate(searchCatsKeyWordProvider);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CatPage(cat: cat),
          ),
        );
      },
      child: AppWidgets.customCard(
          cardColor: AppColors.white.withOpacity(0.5),
          //containerHeight: MediaQuery.of(context).size.height * 0.74,
          containerWidth: MediaQuery.of(context).size.width * 0.8,
          customDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), // Borde del contenedor
            border: Border.all(
              color: Colors.black, // Color del borde
              width: 6.0, // Ancho del borde
            ),
          ),
          topLeftRadius: 30,
          topRightRadius: 30,
          bottomLeftRadius: 30,
          bottomRightRadius: 30,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.2),
            child: SizedBox(
              //Aquí va el listado de textos
              height: MediaQuery.of(context).size.height * 0.49,
              //width: MediaQuery.of(context).size.width * 0.2,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppWidgets.mainText(context, ' ${cat.name}', 6),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(30), // Borde del contenedor
                          border: Border.all(
                            color: Colors.black, // Color del borde
                            width: 5.0, // Ancho del borde
                          ),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(cat.urlImage)))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  AppWidgets.mainText(context, 'Description', 3),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: AppWidgets.elipsisText(context, cat.description, 3,
                        maxCharacters: 120),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  AppWidgets.mainText(context, 'See more....', 3),
                ],
              ),
            ),
          )),
    );
  }

  Widget _searchProduct() {
    List<Cat> allCats = ref.watch(searchCatsProvider).toList();
    // Lista filtrada de gatos según la búsqueda

    final keyWordCat = ref.watch(searchCatsKeyWordProvider);

    return AppWidgets.customCard(
      containerWidth: MediaQuery.of(context).size.width * 0.9,
      topRightRadius: 14,
      topLeftRadius: 14,
      bottomRightRadius: 14,
      bottomLeftRadius: 14,
      cardColor: Colors.black.withOpacity(0.2),
      margin: const EdgeInsets.only(top: 30, bottom: 20, left: 15),
      child: ExpansionTile(
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.search,
                  color: AppColors.white,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  // controller: searchController,
                  style: TextStyle(color: AppColors.white),
                  decoration: InputDecoration(
                    hintText: keyWordCat,
                    hintStyle:
                        TextStyle(color: AppColors.white.withOpacity(0.5)),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    ref.read(searchCatsKeyWordProvider.notifier).state = value;
                  },
                ),
              ),
            ),
          ],
        ),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            // Altura máxima del contenedor
            child: ListView.builder(
              itemCount: allCats.length,
              itemBuilder: (context, index) {
                final cat = allCats[index];
                return ListTile(
                  title: Text(
                    cat.name,
                    style: TextStyle(color: AppColors.white),
                  ),
                  onTap: () {
                    ref.invalidate(searchCatsKeyWordProvider);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CatPage(cat: cat),
                      ),
                    );
                    // Aquí puedes realizar alguna acción cuando se seleccione un elemento de búsqueda
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
