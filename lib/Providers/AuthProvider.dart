import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/database/model/User.dart' as MyUser;

import '../data/database/UsersDao.dart';
class AuthProviders extends ChangeNotifier{
  User? firebaseAuthUser;
  MyUser.User? databaseUser;
  String? userId;
  String? setUserId(id){
    id = userId;
    notifyListeners();
    return id;

  }

  Future<void> register (String email,String password,String fullName,String mobileNum)async{
    var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password);
    await UsersDao.createUser(MyUser.User(
      id:result.user?.uid ,
      fullName:fullName ,
      mobileNum:mobileNum ,
      email:email ,

    ) );
  }
  Future<void> login (String email,String password)async{
    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );

    var user = await UsersDao.getUser(result.user!.uid);
    databaseUser = user;
    firebaseAuthUser = result.user;
    print(user);
  }

  void logout()
  {
    databaseUser =null;
    FirebaseAuth.instance.signOut();
  }



  Future<void> retrieveUserFromDatabase()async {
    firebaseAuthUser = FirebaseAuth.instance.currentUser;
    databaseUser =await UsersDao.getUser(firebaseAuthUser!.uid);
  }
}