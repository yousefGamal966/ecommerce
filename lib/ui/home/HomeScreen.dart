
import 'package:ecommerce/Providers/AuthProvider.dart';
import 'package:ecommerce/ui/home/homeTab/HomeTab.dart';
import 'package:ecommerce/ui/home/profile/ProfileTab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login/LoginScreen.dart';
import 'categories/CategoriesTab.dart';
import 'favorite/FavoritesTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs =[
    HomeTab(),
    CategoriesTab(),
    FavoritesTab(),
    ProfileTab()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProviders>(context);
    return Container(
      child: Scaffold(
       appBar:  AppBar(
          elevation: 0,
          title: Image.asset('assets/images/route.png')

        ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });

        },
        currentIndex:  selectedIndex,
        items: [

        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: '',backgroundColor: Theme.of(context).primaryColor,),
        BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: '',backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: '',backgroundColor: Theme.of(context).primaryColor),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: '',backgroundColor: Theme.of(context).primaryColor),
        ],
      )  ,
        body: tabs[selectedIndex],
      ),
    );
  }
}
