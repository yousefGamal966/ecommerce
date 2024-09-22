import 'package:ecommerce/data/dataSourceContract/BrandsDataSource.dart';
import 'package:ecommerce/data/dataSourceContract/CategoriesDataSource.dart';
import 'package:ecommerce/domain/model/Brand.dart';
import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/domain/repository/BrandsRepository.dart';
import 'package:ecommerce/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl extends BrandsRepository{
  BrandsDataSource onlineDataSource;
  @factoryMethod BrandsRepositoryImpl(this.onlineDataSource);
  @override
  Future<List<Brand>?> getBrand() {
    return onlineDataSource.getBrands();
  }


}