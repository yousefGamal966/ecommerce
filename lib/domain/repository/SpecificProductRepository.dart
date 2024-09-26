import 'package:ecommerce/domain/model/Product.dart';

abstract class SpecificProductRepository {
  Future<List<Product>?> getSpecificProduct (String id);
}