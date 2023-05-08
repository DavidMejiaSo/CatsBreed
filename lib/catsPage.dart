import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/responsive.dart';
import 'package:http/http.dart' as http;

class catsPage extends StatefulWidget {
  const catsPage({super.key});

  @override
  State<catsPage> createState() => _catsPageState();
}

class _catsPageState extends State<catsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CatsService().myCats(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                  width: Adapt.wp(85),
                  height: Adapt.hp(100),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Container(
                          child: Column(
                            children: [
                              Text(snapshot.data[index]["name"]),
                              SizedBox(
                                height: Adapt.hp(2),
                              ),
                              //Container(
                              //  width: Adapt.wp(40),    //ESTA LINEA SE COMENTÓ POR DUDAS EN LAS IMAGENES DE LOS GATOS, se intentó de muchas maneras uniendo las APIS, pero no encontré la solución
                              //
                              //  height: Adapt.hp(15),
                              //  decoration: BoxDecoration(
                              //      image: DecorationImage(
                              //          fit: BoxFit.contain,
                              //          image: NetworkImage(
                              //              'https://api.thecatapi.com/v1/breeds/images/' +
                              //                  snapshot.data[index]
                              //                      ["reference_image_id"]))),
                              //),
                              Container(
                                width: Adapt.wp(40),
                                height: Adapt.hp(15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                            'https://nupec.com/wp-content/uploads/2021/02/Captura-de-pantalla-2021-02-08-a-las-13.59.48.png'))),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Adapt.wp(7),
                                  ),
                                  Column(
                                    children: [
                                      Text("Origin",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 10, 10, 10),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Text(snapshot.data[index]["origin"],
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 10, 10, 10),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    width: Adapt.wp(45),
                                  ),
                                  Column(
                                    children: [
                                      Text("Inteligencia",
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 10, 10, 10),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          )),
                                      Text(
                                          snapshot.data[index]["intelligence"]
                                              .toString(),
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 10, 10, 10),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                          ))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class CatsService {
  Future<dynamic> myCats() async {
    String url = 'https://api.thecatapi.com/v1/breeds';

    final res = await http.get(
      Uri.parse(url),
      headers: {
        'key': 'x-api-key:bda53789-d59e-46cd-9bc4-2936630fde39',
        'Content-Type': 'application/json ',
      },
    );

    dynamic respuesta = json.decode(res.body);

    print(respuesta);
    return respuesta;
  }
}
