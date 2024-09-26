
import 'package:ecommerce/Providers/AuthProvider.dart';
import 'package:ecommerce/ui/home/homeTab/HomeTab.dart';
import 'package:ecommerce/ui/home/productsTab/ProductsTab.dart';
import 'package:ecommerce/ui/home/profile/ProfileTab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cartScreen/CartScreen.dart';
import '../login/LoginScreen.dart';
import 'favorite/FavoritesTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> tabs =[
    HomeTab(),
    ProductsTab(),
    FavoritesTab(),
    ProfileTab()
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProviders>(context);
    return Container(
      child: Scaffold(
        backgroundColor:  Color(0xFFFDFDFD),
       appBar:  AppBar(
         backgroundColor:  Color(0xFFFDFDFD),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/route.png'),
              IconButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  CartScreen() ,) );

              }, icon: Icon(Icons.shopping_cart_outlined,color: Color(
                  0xFF004181),))
            ],
          )

        ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        iconSize: 34,
        selectedIconTheme: IconThemeData(
          color: Color(0xFF004181)
        ),

        onTap: (index){
          setState(() {
            selectedIndex=index;
          });

        },
        currentIndex:  selectedIndex,
        items: [

        BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/home_icon.png')),label: '',backgroundColor: Theme.of(context).primaryColor,activeIcon:
        ClipRRect(

        borderRadius: BorderRadius.circular(15),

            child: Container(
                color: Colors.white,
                child: ImageIcon(AssetImage('assets/images/home_icon.png')))), ),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/products_icon.png')),label: '',backgroundColor: Theme.of(context).primaryColor,activeIcon:
        ClipRRect(

            borderRadius: BorderRadius.circular(15),

            child: Container(
                color: Colors.white,
                child: ImageIcon(AssetImage('assets/images/products_icon.png')))),),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/heart_icon.png')),label: '',backgroundColor: Theme.of(context).primaryColor,activeIcon:
        ClipRRect(

            borderRadius: BorderRadius.circular(15),

            child: Container(
                color: Colors.white,
                child: ImageIcon(AssetImage('assets/images/heart_icon.png')))),),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/profile_icon.png')),label: '',backgroundColor: Theme.of(context).primaryColor,activeIcon:
        ClipRRect(

            borderRadius: BorderRadius.circular(15),

            child: Container(
                color: Colors.white,
                child: ImageIcon(AssetImage('assets/images/profile_icon.png')))),),
        ],
      )  ,
        body: tabs[selectedIndex],
      ),
    );
  }
}
