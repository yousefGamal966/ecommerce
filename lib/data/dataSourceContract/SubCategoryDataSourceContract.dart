
import 'package:ecommerce/domain/model/Category.dart';

import '../../domain/model/SubCategory.dart';

abstract class SubCategoryDataSourceContract {
  Future<List<Category>?> getSubCategories(String catId);
}