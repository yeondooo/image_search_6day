import 'package:flutter/material.dart';
import 'package:image_search_6day/domain/repository/photo_repository.dart';
import 'package:image_search_6day/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;

  MainViewModel(this._photoRepository);

  MainState _state = const MainState();

  MainState get state => _state;

  void fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      photos: await _photoRepository.getPhotos(query),
      isLoading: false,
    );
    notifyListeners();
  }
}
