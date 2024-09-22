import '../model/Product.dart';

abstract class ProductsRepository{
  Future<List<Product>?> getProducts();

}
