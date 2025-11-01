import 'package:huungry/core/network/api_service.dart';
import 'package:huungry/features/home/data/models/product_model.dart';
import 'package:huungry/features/home/data/models/topping_model.dart';

class ProductRepo {
  final ApiService _apiService = ApiService();

  /// get products
  Future<List<ProductModel>> getProducts () async {
    try {
      final response = await _apiService.get('/products');
      return (response['data'] as List)
          .map((product) => ProductModel.fromJson(product))
          .toList();
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  /// get Toppings
Future<List<ToppingModel>> getToppings () async{
   try {
     final response = await _apiService.get('/toppings');
     return (response ['data'] as List)
         .map((topping)  => ToppingModel.fromJson(topping))
         .toList();
   } catch (e) {
     print(e.toString());
     return[];
   }
}

/// get Options
  Future<List<ToppingModel>> getOptions  () async{
    try {
      final response = await _apiService.get('/side-options');
      return (response ['data'] as List)
          .map((topping)  => ToppingModel.fromJson(topping))
          .toList();
    } catch (e) {
      print(e.toString());
      return[];
    }
  }

 /// search

 ///  category

}