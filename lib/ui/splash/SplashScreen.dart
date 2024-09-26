
import 'dart:async';

import 'package:ecommerce/Providers/AuthProvider.dart' as auth;
import 'package:ecommerce/Providers/CartProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/HomeScreen.dart';
import '../login/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Timer(Duration(seconds: 3), () {
      navigate();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/splashScreen.png',fit: BoxFit.fill,width: double.infinity,height: double.infinity,),

    );
  }

  void navigate() async{
    var authProvider = Provider.of<auth.AuthProviders>(context,listen: false);
    var cartProvider = Provider.of<CartProvider>(context,listen: false);
      if(FirebaseAuth.instance.currentUser != null){
        await authProvider.retrieveUserFromDatabase();
        cartProvider.uid = authProvider.firebaseAuthUser!.uid;
         Navigator.pushReplacementNamed(context,HomeScreen.routeName);

      }else{
         await Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }


  }
}
