import 'dart:convert'; // For decoding JSON data
import 'package:ecommerce_code/API/apihelper.dart';
import 'package:http/http.dart' as http;

class Store {
  // final String baseUrl = 'https://api.escuelajs.co/api/v1';

  // Fetch product by ID
  Future<List<dynamic>> fetchProducts() async {
    final String baseUrl = HelperAPI.allProductsUrl;

    final url = Uri.parse(baseUrl);

    try {
      // Sending GET request to the API
      final response = await http.get(url);

      final Map<String, dynamic> mapData = json.decode(response.body);
      final List<dynamic> productData = mapData['products'];

      // print(productData);
      return productData;
    } catch (error) {
      // Handle network or parsing error
      print('Error fetching product: $error');
      return [];
    }
  }

  Future<List<dynamic>> searchProducts(String query) async {
    final String baseUrl = HelperAPI.searchUrl;

    final url = Uri.parse(baseUrl + query);

    try {
      // Sending GET request to the API
      final response = await http.get(url);

      final Map<String, dynamic> mapData = json.decode(response.body);
      final List<dynamic> productData = mapData['products'];

      // print(productData);
      return productData;
    } catch (error) {
      // Handle network or parsing error
      print('Error fetching product: $error');
      return [];
    }
  }

  Future<List<dynamic>> getProductByCategory(String category) async {
    final String baseUrl = HelperAPI.categoryUrl;

    final url = Uri.parse(baseUrl + category);

    try {
      // Sending GET request to the API
      final response = await http.get(url);

      final Map<String, dynamic> mapData = json.decode(response.body);
      final List<dynamic> productData = mapData['products'];

      // print(productData);
      return productData;
    } catch (error) {
      // Handle network or parsing error
      print('Error fetching product: $error');
      return [];
    }
  }
}
