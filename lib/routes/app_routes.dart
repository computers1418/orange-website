import 'package:dentist_india_plus/booking_page.dart';
import 'package:dentist_india_plus/home_page.dart';
import 'package:dentist_india_plus/payment_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;

class Routes {
  //common routes
  static const String splash = '/';
  static const String booking = '/booking';
  static const String payment = '/payment';
}

class RouteGenerator {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/booking',
      page: () => const BookingPage(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/payment',
      page: () => const PaymentPage(),
      transition: nav.Transition.noTransition,
    ),
  ];
}