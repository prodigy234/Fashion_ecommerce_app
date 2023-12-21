import 'dart:convert';
import 'package:fashion_ecommerce_app/features/model/get_all_products_model.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetProductsService {
  Future getProducts() async {
    List<GetAllProductsModel> allProducts = [];
    String url = 'https://fakestoreapi.com/products';

    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    // print(response.body);

    try {
      if (response.statusCode == 200) {
        for (var products in data) {
          GetAllProductsModel getAllProductsModel =
              GetAllProductsModel.fromJson(products);
          allProducts.add(getAllProductsModel);
        }
        //  print(data);
        // print(allProducts.length);
        return data;

        //.toList();
      } else {
        debugPrint('Failed');
        debugPrint(response.body);
        debugPrint(response.statusCode.toString());
      }
      return allProducts;
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}
