import 'package:ecommerce/di/di.dart';
import 'package:ecommerce/ui/home/categories/ProductsTabViewModel.dart';
import 'package:ecommerce/ui/home/categories/ProductsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../DialogUtils.dart';
import '../../../domain/model/Product.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  ProductTabViewModel viewModel = getIt<ProductTabViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductTabViewModel,ProductTabState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is Error) return false;
        if (current is Loading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is Error) return true;
        if (current is Loading) return true;
        return false;
      },

      builder:(context, state) {
        if (state is Success){
          return buildSuccessStateWidget(state.products??[]);
        }
        return Scaffold(
          appBar: AppBar(title: Text('Default Screen'),),
          body: Center(child:CircularProgressIndicator() ,),
        );
      },
      listener: (context, state) {
        if (state is Loading){
          DialogUtils.showLoading(context, 'Loading..');
        }
        if (state is Error ){
          DialogUtils.showMessage(context, 'Something Is Wrong',posActionTitle: 'OK');
          print(state.message);
        }
      },


    );

  }
  Widget buildSuccessStateWidget(List<Product>products) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce'),
      ),
      body:Column(
        children: [
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2
              ), itemBuilder: (context, index) {
              return ProductsWidget(products[index]);
            },itemCount: products.length,),
          ),
        ],
      ) ,
    );
  }
}