import 'package:ecommerce/api/ApiManger.dart';
import 'package:ecommerce/data/dataSourceContract/CategoriesDataSource.dart';
import 'package:ecommerce/data/model/categoriesResponse/CategoriesResponse.dart';
import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CategoriesDataSource)
class CategoriesOnlineDataSource extends CategoriesDataSource{
  ApiManger apiManger;
  @factoryMethod CategoriesOnlineDataSource(this.apiManger);
  @override
  Future<List<Category>?> getCategories()async {
    var response = await apiManger.getCategories();
     return response.data?.map((catDto) => catDto.toCategory() ).toList();

  }
}