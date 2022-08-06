import 'package:bank_project/pages/create_trips.dart';
import 'package:bank_project/pages/home_page.dart';
import 'package:bank_project/pages/login_page.dart';
import 'package:bank_project/pages/profile_page.dart';
import 'package:bank_project/pages/signup_page.dart';
import 'package:bank_project/pages/splash_screen.dart';
import 'package:bank_project/pages/transactions_page.dart';
import 'package:bank_project/providers/auth_providers.dart';
import 'package:bank_project/providers/trans_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      // ChangeNotifierProvider(
      //   create: (context) => PetsProvider(),
      //   child: MyApp(),
      // ),
      MultiProvider(
    providers: [
      ChangeNotifierProvider<TripsProviders>(create: (_) => TripsProviders()),
      ChangeNotifierProvider<AuthProviders>(create: (_) => AuthProviders()),
    ],
    child: MyApp(),
  ));
}

final _router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const SplashScreen()),
  GoRoute(path: "/home", builder: (context, state) => const HomePage()),
  GoRoute(path: "/signin", builder: (context, state) => LoginScreen()),
  GoRoute(path: "/signup", builder: (context, state) => const SignupPage()),
  GoRoute(path: "/profile", builder: (context, state) => const ProfilePage()),
  GoRoute(path: "/trips", builder: (context, state) => Trips()),
  GoRoute(path: "/create", builder: (context, state) => CreateTripsPage()),
]);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
