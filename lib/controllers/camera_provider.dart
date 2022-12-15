import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterdemo/models/product_model.dart';
import 'package:flutterdemo/repositories/product_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CameraProvider with ChangeNotifier {

  CameraProvider(this._productRepository);

  ProductRepository _productRepository;

  File? _selectedImage;
  List<ProductJson> _similarProducts = [];
  List<ProductJson> _products = [];

  List<ProductJson> get products => _products;
  File? get selectedImage => _selectedImage;
  List<ProductJson> get similarProducts => _similarProducts;

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

  Future<void> getProductsList() async {
    print('in method');
    _products = await _productRepository.getProductList();
    notifyListeners();
    print('search' + products[0].category);
    //notifyListeners();
  }

  ProductJson getProduct(String id) {
    ProductJson product = ProductJson.empty();
    for (var product in _products) {
      print("prod,, ${product.id}");
      if(id == product.id){
        return product;
      }
    }
    return product;
  }

  List<ProductJson> setSimilarProducts(List similarImages){
    List<ProductJson> list = [];
    for (var element in similarImages) {
      list.add(getProduct(element));
    }

    _similarProducts = list;
    return _similarProducts;

  }

}