import 'package:dentist_india_plus/booking_page.dart';
import 'package:dentist_india_plus/home_page.dart';
import 'package:dentist_india_plus/pages/about/about_view.dart';
import 'package:dentist_india_plus/pages/contact/contact_view.dart';
import 'package:dentist_india_plus/pages/privacy/privacy_policy_view.dart';
import 'package:dentist_india_plus/pages/refund/refund_policy_view.dart';
import 'package:dentist_india_plus/pages/terms/terms_view.dart';
import 'package:dentist_india_plus/payment_page.dart';
import 'package:dentist_india_plus/widgets/location_view.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart' as nav;

class Routes {
  //common routes
  static const String splash = '/';
  static const String booking = '/booking';
  static const String payment = '/payment';
  static const String location = '/location';

  static const String about = '/about';
  static const String contact = '/contact';
  static const String terms = '/terms';
  static const String privacy = '/privacy-policy';
  static const String refund = '/refund-policy';
}

class RouteGenerator {
  static List<GetPage> pages = [
    GetPage(
      name: '/',
      page: () => const HomePage(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/about',
      page: () => const AboutView(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/location',
      page: () => const LocationView(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/terms',
      page: () => const TermsView(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/privacy-policy',
      page: () => const PrivacyPolicyView(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/refund-policy',
      page: () => const RefundPolicyView(),
      transition: nav.Transition.noTransition,
    ),
    GetPage(
      name: '/contact',
      page: () => const ContactView(),
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
