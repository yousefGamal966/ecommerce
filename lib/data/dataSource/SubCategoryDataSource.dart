
import 'package:ecommerce/domain/model/Category.dart';
import 'package:injectable/injectable.dart';

import '../../api/ApiManger.dart';
import '../../domain/model/SubCategory.dart';
import '../dataSourceContract/SubCategoryDataSourceContract.dart';
@Injectable(as: SubCategoryDataSourceContract)
class SubCategoryDataSource extends SubCategoryDataSourceContract{
  ApiManger apiManger;
  @factoryMethod SubCategoryDataSource(this.apiManger);
  @override
  Future<List<Category>?> getSubCategories(String catId) async{
    var response = await apiManger.getSubCategories(catId);
    return response.data?.map((e) => e.toCategory(),).toList();
  }
  
}