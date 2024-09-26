import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/domain/useCases/GetCategoriesUseCase.dart';
import 'package:ecommerce/domain/useCases/GetMostSelling.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/Category.dart';
import '../../../domain/model/SubCategory.dart';

import '../../../domain/useCases/GetSubCategoriesUseCase.dart';
@injectable
class ProductsTabViewModel extends Cubit<ProductsTabState>{
  GetMostSelling mostSelling;
  GetCategoriesUseCase categoriesUseCase;
  GetSubCategoriesUseCase subCategoriesUseCase;
  @factoryMethod ProductsTabViewModel(this.mostSelling,this.subCategoriesUseCase
      ,this.categoriesUseCase,
      ):super(Loading());
  void initPage()async {
    emit(Loading());
    try {
      var products = await mostSelling.invoke();
      var categories = await categoriesUseCase.invoke();
      emit(Success(products,categories));
    } catch (e) {
      print("Erorr is $e");
      emit(Error(e.toString()));
    }
  }
}
sealed class ProductsTabState{}
class Loading extends ProductsTabState{}
class Error extends ProductsTabState{
  String? message;
  Error(this.message);
}
class Success extends ProductsTabState{
List<Product>? products;
List<Category>? categories;

Success(this.products,this.categories);
}