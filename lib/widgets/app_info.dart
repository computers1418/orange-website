import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const Text("App Available to Download", style: TextStyle(
              fontFamily: "KumbhsansSemiBold",
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w800
            )),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      
              Image.asset("res/images/playstore.png", width: 80, height: 30),
              const SizedBox(width: 10,),
              Image.asset("res/images/appstore.png", width: 80, height: 30)
      
            ],
          )
        ],
      ),
    );
  }
}