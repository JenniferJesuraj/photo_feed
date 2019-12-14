import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:photo_feed/model/photo.dart';

class FlickrApiClient {
  static const apiKey = "f6c63a61a3e212240566f4a97d5bee28";
  static const baseUrl =
      'https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=$apiKey';
  final http.Client httpClient;

  const FlickrApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<Photo>> getPhotos(String query) async {
    final photoUrl =
        '$baseUrl&text=$query&extras=url_s&format=json&nojsoncallback=1';
    final response = await this.httpClient.get(photoUrl);
    if (response.statusCode != 200) {
      throw Exception('error getting photos');
    }
    final photos = json.decode(response.body)['photos']['photo'] as List;

    return photos
        .map((rawPhoto) {
          return Photo(
            farm: rawPhoto['farm'],
            height_s: rawPhoto['height_s'],
            id: rawPhoto['id'],
            isfamily: rawPhoto['isfamily'],
            isfriend: rawPhoto['isfriend'],
            ispublic: rawPhoto['ispublic'],
            owner: rawPhoto['owner'],
            secret: rawPhoto['secret'],
            server: rawPhoto['server'],
            title: rawPhoto['title'],
            url_s: rawPhoto['url_s'],
            width_s: rawPhoto['width_s'],
          );
        })
        .takeWhile((photo) => photo.url_s != null)
        .toList();
  }
}
