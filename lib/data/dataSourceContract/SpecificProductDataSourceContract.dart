import 'package:ecommerce/domain/model/Product.dart';

abstract class SpecificProductDataSourceContract {
  Future<List<Product>?> getSpecificProduct(String id);
}