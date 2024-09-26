import 'package:ecommerce/data/dataSourceContract/SpecificProductDataSourceContract.dart';
import 'package:ecommerce/domain/model/Product.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/SpecificProductRepository.dart';
@Injectable(as: SpecificProductRepository)
class SpecificProductRepositoryImpl extends SpecificProductRepository{
  SpecificProductDataSourceContract specificProductDataSourceContract;
  @factoryMethod SpecificProductRepositoryImpl(this.specificProductDataSourceContract);

  @override
  Future<List<Product>?> getSpecificProduct(String id) {
    return specificProductDataSourceContract.getSpecificProduct(id);

  }

}