import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:photo_album/model/photo.dart';
import 'package:photo_album/utils/constants.dart';

Future<List<Photo>> getPhotosFromApi(http.Client client) async {
  try {
    final Uri url =
        Uri.parse('${Constants.baseUrl}${Constants.photoAlbumEndPoint}');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return compute(_parsedPhotoList, response.body);
    } else if (response.statusCode == 400) {
      throw Exception(
          'The server can not or will not process the request due to something that is perceived to be a client error.');
    } else {
      throw Exception('Failed to fetch photos: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to fetch photos: $e');
  }
}

List<Photo> _parsedPhoto(String responseBody) {
  final parsedJson =
      (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
  return parsedJson.map<Photo>((element) => Photo.fromJson(element)).toList();
}

List<Photo> _parsedPhotoList(String responseBody){
  return (jsonDecode(responseBody) as List<dynamic>).map((element) => Photo.fromJson(element)).toList();
}
