import 'package:ecommerce/DialogUtils.dart';
import 'package:ecommerce/FireBaseErrorCodes.dart';
import 'package:ecommerce/Providers/CartProvider.dart';
import 'package:ecommerce/ui/register/RegisterScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/AuthProvider.dart';
import '../../ValidUtils.dart';
import '../common/CustomFormField.dart';
import '../home/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email=TextEditingController();

  TextEditingController password=TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset('assets/images/route_white.png'),
              
              Text('Welcome Back To Route',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
              Text('Please sign in with your E-Mail',style: TextStyle(color: Colors.white),),




              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    ' E-mail Address',

                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                  hintText: 'Enter Your E-mail address',
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  validator:(text){
                    if(text == null || text.trim().isEmpty){
                      return 'please enter email address';
                    }
                    if(!isValidEmail(text)){
                      return 'Bad Format';
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    ' Password',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                  hintText: 'Enter Your Password',
                  secure: true,
                  controller: password,
                  validator:(text){
                    if(text == null || text.trim().isEmpty){
                      return 'please enter password';
                    }
                    if(text.length<6){
                      return 'password should be at least 6 characters';
                    }
                    return null;
                  }),
              SizedBox(
                height: 40,
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(1),
                  child: ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    child: Text('Log in'),
                  )),
              TextButton(onPressed: (){
                Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
              }, child: Text('Create Account',style: TextStyle(color: Colors.white),))

            ],
          ),
        ),
      ),
    );
  }

 void login()async{
    if(formKey.currentState?.validate() == false){
      return ;
    }
    var authProvider = Provider.of<AuthProviders>(context,listen: false);
    var cartProvider = Provider.of<CartProvider>(context,listen: false);
    try {
      DialogUtils.showLoading(context, 'Loading. Please Be Patient');
      cartProvider.uid = authProvider.firebaseAuthUser!.uid;
      await authProvider.login(email.text, password.text);
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context,'User Logged in Successful',posActionTitle: 'OK',posAction:(){
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      });
          
      DialogUtils.hideDialog(context);
      DialogUtils.showMessage(context,'User Logged in Successful',posActionTitle: 'OK',posAction:(){
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      });



    } on FirebaseAuthException catch (e) {
      print('error :$e');
      if (e.code == FireBaseErrorCodes.userNotFound||
          e.code == FireBaseErrorCodes.wrongPassword||
          e.code == FireBaseErrorCodes.invalidLogin||
          e.code == FireBaseErrorCodes.invalidLogin2) {
        DialogUtils.showMessage(context, 'Wrong Email Or Password',posActionTitle: 'OK');
        
      }
    }
  }
}
