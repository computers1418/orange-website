import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../home_page.dart';
import '../routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dentist India Plus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffff8412)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      getPages: RouteGenerator.pages,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            // Determine if the view is a desktop view based on width
            bool isDesktop = constraints.maxWidth >= 800; // Example width threshold

            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: Scaffold(
                body: isDesktop ? const DesktopContent() : child!,
              ),
            );
          },
        );
      },
    );
  }
}

class DesktopContent extends StatelessWidget {
  const DesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
              'Desktop view is not available.',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Kumbhsans',),
              textAlign: TextAlign.center,
              
            ),
            SizedBox(height: 8),
            Text(
              'Please switch to a mobile view to continue.',
              style: TextStyle(fontSize: 18, fontFamily: 'Kumbhsans',),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
