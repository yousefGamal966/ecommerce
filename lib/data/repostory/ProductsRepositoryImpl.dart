import 'package:ecommerce/data/dataSourceContract/ProductsDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Product.dart';
import '../../domain/repository/ProductsRepository.dart';
@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl extends ProductsRepository{
  ProductsDataSource dataSource;
  @factoryMethod ProductsRepositoryImpl(this.dataSource);
  @override
  Future<List<Product>?> getProducts() {
    return dataSource.getProducts();
  }
}