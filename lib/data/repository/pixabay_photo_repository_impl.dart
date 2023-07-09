import 'package:image_search_6day/data/api/pixabay_api.dart';
import 'package:image_search_6day/data/mapper/photo_mapper.dart';
import 'package:image_search_6day/data/model/photo.dart';
import 'package:image_search_6day/data/repository/photo_repository.dart';

class PixabayPhotoRepositoryImpl implements PhotoRepository {
  final _api = PixabayApi();

  @override
  Future<List<Photo>> getPhotos(String query) async {
    final resultDto = await _api.getImages(query);

    if (resultDto.hits == null) {
      return [];
    }

    return resultDto.hits!.map((e) => e.toPhoto()).toList();
  }
}
