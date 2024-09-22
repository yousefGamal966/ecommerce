import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/domain/repository/ProductsRepository.dart';

abstract class ProductsDataSource{
  Future<List<Product>?> getProducts();
}