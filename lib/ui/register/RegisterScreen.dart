import 'package:ecommerce/DialogUtils.dart';
import 'package:ecommerce/FireBaseErrorCodes.dart';
import 'package:ecommerce/Providers/AuthProvider.dart';
import 'package:ecommerce/ValidUtils.dart';
import 'package:ecommerce/ui/common/CustomFormField.dart';
import 'package:ecommerce/ui/login/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'reg';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController mobileNum = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

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
              SizedBox(height: 30,),
              Image.asset('assets/images/route_white.png'),

              Row(
                children: [
                  Text(
                    ' Full Name',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                  hintText: 'Enter Your Full Name',
                  keyboardType: TextInputType.name,
                  controller: fullNameController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter full name';
                    }
                    return null;
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    ' Mobile Number',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomFormField(
                  hintText: 'Enter Your Mobile Number',
                  keyboardType: TextInputType.number,
                  controller: mobileNum,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter mobile number';
                    }
                    return null;
                  }),
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
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter email address';
                    }
                    if (!isValidEmail(text)) {
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
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter password';
                    }
                    if (text.length < 6) {
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
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ButtonStyle(shape:  WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)))),
                    onPressed: () {
                      signUp();
                    },
                    child: Text('Sign up',style: TextStyle(color: Color(
                        0xFF004181),fontSize: 20),),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  child: Text('Are you Have An Account ?',style: TextStyle(color: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }

  void signUp()async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    var authProvider = Provider.of<AuthProviders>(context,listen: false);
    try{
      DialogUtils.showLoading(context, 'Loading. Please Be Patient');
      await authProvider.register(email.text, password.text, fullNameController.text, mobileNum.text);
      DialogUtils.showMessage(context, 'Account Created Successfully',
          posActionTitle: 'OK', posAction: () {
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          });
    }on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      if (e.code ==FireBaseErrorCodes.weakPassword ) {
        DialogUtils.showMessage(context, 'Weak Password');
      } else if (e.code ==FireBaseErrorCodes.emailUsed) {
        DialogUtils.showMessage(context, 'Email is Used Before',posActionTitle: 'Ok');
      }
    } catch (e) {
      print(e);
    }


  }
}
