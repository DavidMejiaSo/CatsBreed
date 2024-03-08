import 'package:flutter_application_1/providers/cats_list_provider.dart';
import 'package:riverpod/riverpod.dart';

import '../Infraestructure/entities/cat.dart';

final searchCatsProvider = StateProvider<List<Cat>>((ref) {
  //Listado de gatos filtrado
  final keyWord = ref.watch(searchCatsKeyWordProvider);
  final catsState = ref.watch(catsProvider);
  final catData = catsState.allCats;

  if (keyWord.isEmpty) {
    return catData; // Si la palabra clave está vacía, retorna la lista completa de gatos
  } else {
    // Filtra la lista de gatos según la palabra clave
    return catData
        .where((cat) => cat.name.toLowerCase().contains(keyWord.toLowerCase()))
        .toList();
  }
});

final searchCatsKeyWordProvider = StateProvider<String>((ref) {
  //Provider que Almacena la palabra del TexFormField de busqueda
  return '';
});
