import 'package:ecommerce/api/ApiManger.dart';
import 'package:ecommerce/data/dataSourceContract/ProductsDataSource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Product.dart';
import '../../domain/repository/ProductsRepository.dart';
@Injectable(as: ProductsDataSource)
class ProductsOnlineDataSource extends ProductsDataSource{
  ApiManger apiManger;
  @factoryMethod ProductsOnlineDataSource(this.apiManger);
  @override
  Future<List<Product>?> getProducts()async {
    var response = await apiManger.getProducts();
    return response.data?.map((pDto) => pDto.toProduct()).toList();
  }

}