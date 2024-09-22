import 'package:ecommerce/Providers/AuthProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../login/LoginScreen.dart';

class ProfileTab extends StatefulWidget {
User? user ;
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var authProvider = Provider.of<AuthProviders>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mediaQuery.height*0.05,),
          Text ('Your Full Name',
            style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20,color: Color(0xFF06004F)),),
          SizedBox(height: 5,),
          Card(

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                  side:BorderSide(color: Color(0xFF004181),strokeAlign: 5) ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width:mediaQuery.width *0.8 ,
                  child: Text(authProvider.databaseUser?.fullName??"not found",
                    style: TextStyle(
                      fontSize: 17,),),
                ),
              )),
          SizedBox(height: mediaQuery.height*0.05,),
          Text ('Your E-Mail',style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20,color: Color(0xFF06004F)),),
          Card(

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                  side:BorderSide(color: Color(0xFF004181),strokeAlign: 5) ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width:mediaQuery.width *0.8 ,
                  child: Text(authProvider.databaseUser?.email??"not found",
                    style: TextStyle(
                    fontSize: 17,)),
                ),
              )),
          SizedBox(height: mediaQuery.height*0.05,),

          Text ('Your Mobile Number',style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 18,color: Color(0xFF06004F)),),
          Card(

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                  side:BorderSide(color: Color(0xFF004181),strokeAlign: 5) ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width:mediaQuery.width *0.8 ,
                  child: Text(authProvider.databaseUser?.mobileNum??"not found",
                      style: TextStyle(
                        fontSize: 17,)),
                ),
              )),
          SizedBox(height: mediaQuery.height*0.05,),

          SizedBox(height: mediaQuery.height*0.3,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){
                authProvider.logout();
                Navigator.pushReplacementNamed(context,LoginScreen.routeName);
              }, child: Text('Press to Logout',style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 18,color: Color(0xFF06004F)),),),
            ],
          ),
        ],
      ),
    );
  }
}