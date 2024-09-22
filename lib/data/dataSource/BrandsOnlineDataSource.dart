import 'package:ecommerce/api/ApiManger.dart';
import 'package:ecommerce/data/dataSourceContract/BrandsDataSource.dart';
import 'package:ecommerce/data/dataSourceContract/CategoriesDataSource.dart';
import 'package:ecommerce/data/model/categoriesResponse/CategoriesResponse.dart';
import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Brand.dart';
@Injectable(as:BrandsDataSource)
class BrandsOnlineDataSource extends BrandsDataSource{
  ApiManger apiManger;
  @factoryMethod BrandsOnlineDataSource(this.apiManger);
  @override
  Future<List<Brand>?> getBrands()async {
    var response = await apiManger.getBrands();
    return response.data?.map((catDto) => catDto.toBrand() ).toList();

  }
}