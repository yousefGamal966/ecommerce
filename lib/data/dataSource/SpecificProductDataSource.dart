import 'package:ecommerce/api/ApiManger.dart';
import 'package:ecommerce/data/dataSourceContract/SpecificProductDataSourceContract.dart';
import 'package:ecommerce/domain/model/Product.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SpecificProductDataSourceContract)
class SpecificProductDataSource extends SpecificProductDataSourceContract{
  ApiManger apiManger;
@factoryMethod SpecificProductDataSource(this.apiManger);
  @override
  Future<List<Product>?> getSpecificProduct(String id)async {
    var response =await apiManger.getSpecificProducts(id);
    return response.data?.map((e) => e.toProduct(),).toList();
  }
}