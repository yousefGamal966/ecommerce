import 'dart:convert';

import 'package:ecommerce/data/model/categoriesResponse/CategoriesResponse.dart';
import 'package:ecommerce/data/model/productsResponse/ProductsResponse.dart';
import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/domain/repository/ProductsRepository.dart';
import 'package:http/http.dart'as http;
import 'package:injectable/injectable.dart';

import '../data/model/brandsResponse/BrandsResponse.dart';
import '../data/model/subCategory/SubCategoryResponse.dart';
@singleton
@injectable
class ApiManger{
  static const String baseUrl = 'ecommerce.routemisr.com';
 Future<CategoriesResponse> getCategories()async{
 var url = Uri.https(baseUrl,'api/v1/categories');
 var response = await http.get(url);
 var categoriesResponse = CategoriesResponse.fromJson(jsonDecode(response.body));
 return categoriesResponse;
  }
  Future<BrandsResponse> getBrands()async{
  var url = Uri.https(baseUrl,'api/v1/brands');
  var response = await http.get(url);
  var brandsResponse = BrandsResponse.fromJson(jsonDecode(response.body));
  return brandsResponse;
  }
  Future<ProductsResponse> getProducts()async{

  var url = Uri.https(baseUrl,'api/v1/products');
  var response = await http.get(url);
  var productsResponse = ProductsResponse.fromJson(jsonDecode(response.body));
  return productsResponse;
  }
  Future<CategoriesResponse> getSubCategories (String catId)async{
  var url = Uri.https(baseUrl,'categories/$catId/subcategories');
  var response = await http.get(url);
  var categoriesResponse = CategoriesResponse.fromJson(jsonDecode(response.body));
  return categoriesResponse;

  }

  Future<ProductsResponse> getSpecificProducts(String id)async{

   var url = Uri.https(baseUrl,'api/v1/products/$id');
   var response = await http.get(url);
   var productsResponse = ProductsResponse.fromJson(jsonDecode(response.body));
   return productsResponse;
  }
  
}