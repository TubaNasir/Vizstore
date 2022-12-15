import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CameraProvider with ChangeNotifier {


  Future<List<dynamic>> getSimilarImages(File file, String link) async {
    ///MultiPart request
    String filename = file.path.split('/').last;
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(link),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    http.StreamedResponse response = await request.send();
    //var responseBytes = await response.stream.toBytes();
    //var responseString = utf8.decode(responseBytes);
    var test1 = await http.Response.fromStream(response);
    final result = jsonDecode(test1.body) as Map<String, dynamic>;
    print(result);
    print(result['SimilarImages']);

    print('\n\n');
    print('RESPONSE WITH HTTP');
    print(response.toString());
    print('\n\n');
    return result['SimilarImages'];
  }
}