import 'package:flutter_application_1/Infraestructure/entities/cat.dart';
import 'package:riverpod/riverpod.dart';

import '../services/cats_service.dart';

final catsProvider = StateNotifierProvider<CatsNotifier, CatsState>((ref) {
  final allCatsData = CatsListData();

  return CatsNotifier(allCatsdata: allCatsData);
});

class CatsNotifier extends StateNotifier<CatsState> {
  final CatsListData allCatsdata;
  CatsNotifier({required this.allCatsdata}) : super(CatsState()) {
    loadCatsList();
  }

  Future loadCatsList() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);

    final allCats = await allCatsdata.getCatsList();
    if (allCats.isEmpty) {
      state = state.copyWith(
        isLoading: false,
      );
      return;
    }

    state = state
        .copyWith(isLoading: true, allCats: [...state.allCats, ...allCats]);
  }
}

class CatsState {
  //Stado de los datos que se requieran usar, sea loaders

  final bool isLoading;
  final List<CatsInfo> allCats;

  CatsState({
    this.isLoading = false,
    this.allCats = const [],
  });

  CatsState copyWith({
    bool? isLoading,
    List<CatsInfo>? allCats,
  }) =>
      CatsState(
        isLoading: isLoading ?? this.isLoading,
        allCats: allCats ?? this.allCats,
      );
}
