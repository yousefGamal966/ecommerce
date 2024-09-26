import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/domain/useCases/SpecificProductUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductDetailsScreenViewModel extends Cubit<DetailsTabState>{
SpecificProductUseCase specificProductUseCase;
  @factoryMethod ProductDetailsScreenViewModel(this.specificProductUseCase
      ):super(Loading());
  void initPage(String id)async {
    emit(Loading());
    try {
        var products = await specificProductUseCase.invoke(id);
      emit(Success(products));
    } catch (e) {
      print("Erorr is $e");
      emit(Error(e.toString()));
    }
  }
}
sealed class DetailsTabState{}
class Loading extends DetailsTabState{}
class Error extends DetailsTabState{
  String? message;
  Error(this.message);
}
class Success extends DetailsTabState{
  List<Product>? products;

  Success(this.products);
}