
import 'package:ecommerce/domain/model/Category.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/SubCategory.dart';
import '../../domain/repository/SubCategoryRepository.dart';
import '../dataSourceContract/SubCategoryDataSourceContract.dart';
@Injectable(as: SubCategoryRepository)
class SubCategoryRepositoryImpl extends SubCategoryRepository{
  SubCategoryDataSourceContract dataSourceContract;
  @factoryMethod SubCategoryRepositoryImpl( this.dataSourceContract);
  @override
  Future<List<Category>?> getSubCategories(String catId) {
  return dataSourceContract.getSubCategories(catId);
  }

}