import 'package:flutter/material.dart';
import 'package:viceversa/views/auth/account_screen.dart';
import 'package:viceversa/views/product/men_screen.dart';
import 'package:viceversa/views/product/women_screen.dart';
import '../views/cart/checkout_screen.dart';
import '../views/main_screen.dart';
import '../views/product/product_detail_screen.dart';
import '../views/splash_screen.dart';
import '../views/welcome_screen.dart';
import '../views/auth/login_screen.dart';
import '../views/auth/register_screen.dart';
import '../views/home/home_screen.dart';
import '../views/cart/cart_screen.dart';
import 'app_routes.dart';

class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.productDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: args),
        );
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case AppRoutes.account:
        return MaterialPageRoute(builder: (_) => AccountScreen());
      case AppRoutes.checkout:
        return MaterialPageRoute(builder: (_) => CheckoutProcess());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }

  static Widget getScreen(String route) {
    switch (route) {
      case AppRoutes.home:
        return HomeScreen();
      case AppRoutes.men:
        return MenScreen();
      case AppRoutes.women:
        return WomenScreen();
      default:
        return SplashScreen();
    }
  }
}
