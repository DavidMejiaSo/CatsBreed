import 'package:dio/dio.dart';
import 'package:flutter_application_1/Infraestructure/entities/cat.dart';
import 'package:flutter_application_1/Infraestructure/mappers/cats_list_mapper.dart';

import '../../constants/enviroment.dart';

class CatsListData {
  //Servicio que hace el llamado a Api
  late final Dio dio;

  CatsListData()
      : dio = Dio(BaseOptions(baseUrl: Enviroment.apiUrl, headers: {
          'key': Enviroment.key,
          'content-type': 'application/json'
        }));
  Future<List<CatsInfo>> getCatsList() async {
    final Response<List<dynamic>> response = await dio.get<List<dynamic>>(
      '/breeds',
    );

    // Verifica si hay datos en la respuesta
    if (response.data != null) {
      // Convierte la lista de datos en objetos CatsInfo
      final List<CatsInfo> catsList =
          CatsInfoMapper.jsonToEntityList(response.data!);

      return catsList;
    } else {
      // Si no hay datos, devuelve una lista vacía
      return [];
    }
  }
}
