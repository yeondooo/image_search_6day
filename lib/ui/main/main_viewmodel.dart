import 'package:flutter/material.dart';
import 'package:image_search_6day/data/model/photo.dart';
import 'package:image_search_6day/data/repository/photo_repository.dart';

class MainViewModel with ChangeNotifier {
  final PhotoRepository _photoRepository;

  MainViewModel(this._photoRepository);

  List<Photo> _photos = [];

  List<Photo> get photos => _photos;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void fetchImages(String query) async {
    _isLoading = true;
    notifyListeners();

    _photos = await _photoRepository.getPhotos(query);

    _isLoading = false;
    notifyListeners();
  }
}
