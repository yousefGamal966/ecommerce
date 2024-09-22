import 'package:ecommerce/data/dataSourceContract/CategoriesDataSource.dart';
import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository{
  CategoriesDataSource onlineDataSource;
 @factoryMethod CategoriesRepositoryImpl(this.onlineDataSource);
  @override
  Future<List<Category>?> getCategories() {
    return onlineDataSource.getCategories();
  }


}