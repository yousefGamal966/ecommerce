import 'package:ecommerce/Providers/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CartScreenWidget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(

      ),
      body: Expanded(
          child: StreamBuilder(
            stream:cartProvider.listenProducts(),
            builder: (context, snapshot) {
              print('+++++++++++');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),

                );

              }
              if(snapshot.hasError)
              {
                print(snapshot.error);
                print('++++++++++');
                return Container(height: 100,width: 100,color: Colors.red,);
              }
              var productsList = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CartScreenWidget(productsList![index]);
                },
                itemCount: productsList?.length ?? 0,
              );
            },
          ))
    );
  }
}
