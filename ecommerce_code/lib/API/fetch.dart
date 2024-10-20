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

      final List<dynamic> productData = json.decode(response.body);
      // final Map<String, dynamic> productData =
      //     jsonData[0] as Map<String, dynamic>;
      // print(productData);
      return productData;
    } catch (error) {
      // Handle network or parsing error
      print('Error fetching product: $error');
      return [];
    }
  }
}
