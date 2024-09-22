
import 'package:ecommerce/Providers/AuthProvider.dart';
import 'package:ecommerce/ui/home/HomeScreen.dart';
import 'package:ecommerce/ui/login/LoginScreen.dart';
import 'package:ecommerce/ui/register/RegisterScreen.dart';
import 'package:ecommerce/ui/splash/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/di.dart';
import 'firebase_options.dart';

void main()async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var provider = AuthProviders();
  runApp(
      ChangeNotifierProvider(
        create: (context) => provider,
        child: MyApp(),
      ));

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      theme: ThemeData(
        primaryColor: Color(0xFF004182),
        useMaterial3: true,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white

        )
      ),
      routes:{
        HomeScreen.routeName :(_)=>HomeScreen(),
        RegisterScreen.routeName :(_)=>RegisterScreen(),
        LoginScreen.routeName : (_)=>LoginScreen(),
        SplashScreen.routeName :(_)=> SplashScreen(),

      },
      initialRoute:SplashScreen.routeName,
    );
  }
}

