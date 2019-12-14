import 'package:photo_feed/model/photo.dart';
import 'package:photo_feed/repository/flickr_api_client.dart';
import 'package:meta/meta.dart';

class PhotosRepository {
  final FlickrApiClient apiClient;

  const PhotosRepository({
    @required this.apiClient,
  }) : assert(apiClient != null);

  Future<List<Photo>> getPhotos(String query) async {
    return await apiClient.getPhotos(query);
  }
}
