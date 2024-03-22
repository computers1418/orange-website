import 'dart:math';

import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/drawer/drawer_dialog.dart';
import 'package:dentist_india_plus/drawer/home_drawer.dart';
import 'package:dentist_india_plus/responsive/size_responsive.dart';
import 'package:dentist_india_plus/widgets/custom_appbar.dart';
import 'package:dentist_india_plus/widgets/header.dart';
import 'package:dentist_india_plus/widgets/home_badge.dart';
import 'package:dentist_india_plus/widgets/indicator.dart';
import 'package:dentist_india_plus/widgets/inner_item.dart';
import 'package:dentist_india_plus/widgets/styled_button.dart';
import 'package:dentist_india_plus/widgets/water_mark.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  final PageController _pageController = PageController();

  ValueNotifier<double> dialogNotifier = ValueNotifier(0);

  late double screenHeight;

  late ValueNotifier<double> notifier = ValueNotifier(0.0);
  late ValueNotifier<Offset> offsetNotifier = ValueNotifier(const Offset(0, 0));

  late AnimationController _controller; 
  late Animation<Offset> cards;
  late Animation<double> watermark;
  late Animation<double> button;
  late Animation<double> header;
  late Animation<double> strip;
  late Animation<double> headerBadge;
  late Animation<double> side2;

  late GlobalKey<ScaffoldState> scaffoldKey;

  bool showForm = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 4), vsync: this);

    _pageController.addListener(_onScroll);

    scaffoldKey = GlobalKey();

   header = Tween<double>(
      begin: -500,
      end: 0
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: const Interval(
        0.3,
        0.5000,
        curve: Curves.easeOut,
      ),
    ));

     strip = Tween<double>(
      begin: -1000,
      end: 40
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: const Interval(
        0.2,
        0.4000,
        curve: Curves.easeOut,
      ),
    ));

   button = Tween<double>(
      begin: -300,
      end: 0
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: const Interval(
        0.3,
        0.5000,
        curve: Curves.easeOut,
      ),
    ));

    side2 = Tween<double>(
        begin: -186,
        end: -130
      ).animate(CurvedAnimation(
        parent: _controller,
        reverseCurve: Curves.ease,
        curve: const Interval(
          0.3,
          0.5000,
          curve: Curves.easeOut,
        ),
        ));


   headerBadge = Tween<double>(
      begin: 600,
      end: 0
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: const Interval(
        0.3,
        0.5000,
        curve: Curves.easeOut,
      ),
    ));

    cards = Tween<Offset>(
      begin: const Offset(0, 800),
      end: const Offset(0, 0)
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: const Interval(
        0.3,
        0.6000,
        curve: Curves.easeOut,
      ),
    ));

    watermark = Tween<double>(
      begin: 200,
      end: 0
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: const Interval(
        0.3,
        0.6000,
        curve: Curves.easeOut,
      ),
    ));


    _controller.forward();
  }

  @override
  void dispose() {
    _pageController.removeListener(_onScroll);
    _pageController.dispose();
    super.dispose();
  }

 void _onScroll() {

    double offset = _pageController.offset/screenHeight;
    notifier.value = offset*30;

    if(offset<=1){
      offsetNotifier.value = Offset(offset*(MediaQuery.of(context).size.width-180), 0);
    }else{
      offsetNotifier.value = Offset(offsetNotifier.value.dx,offset<1.2 ? 0: (offset/3)*(MediaQuery.of(context).size.height/4));
    }
  }

  @override
  Widget build(BuildContext context) {
    
    screenHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const HomeDrawer(),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xffff8412)
          ),
          child: Stack(
            children: [

              AnimatedBuilder(
                animation: strip,
                builder: (_, __) {
                  return Transform.translate(
                    offset: Offset(0, strip.value),
                    child: Transform.rotate(
                      angle: -220 * (pi/180),
                      child: Image.asset("res/images/strip3.png", fit: BoxFit.fill,)));
                }
              ),

              AnimatedBuilder(
                animation: headerBadge,
                builder: (_, __) {
                  return Positioned(
                    bottom: (MediaQuery.of(context).size.height/1.8)-headerBadge.value,
                    right: SizeResponsive.get(context, 26),
                    child: const HomeBadge());
                }
              ),



              Visibility(
                visible: !showForm,
                child: AnimatedBuilder(
                  animation: watermark,
                  builder: (_, __) {
                    return ValueListenableBuilder(
                      valueListenable: offsetNotifier,
                      builder: (_, val, __) {
                        return Positioned(
                          bottom: val.dy,
                          right: val.dx - watermark.value,
                          child: const Padding(
                              padding: EdgeInsets.only(right: 40, bottom: 90, left: 20),
                              child: WaterMark()),
                        );
                      }
                    );
                  }
                ),
              ),
                
              AnimatedBuilder(
                animation: cards,
                builder: (_, __) {
                  return Transform.translate(
                    offset: cards.value,
                    child: Container(
                      alignment: Alignment.center,
                      child: PageView.builder(
                        itemCount: 3,
                        controller: _pageController,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, idx) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 34, 60),
                            child: AnimatedBuilder(
                              animation: _pageController,
                              builder: (_, __){
                              
                                double offset = _pageController.offset/screenHeight;
                              
                                return Opacity(
                                  opacity: (1 + idx - offset)>1 ? 1: (1 + idx - offset)<0 ? 0 : (1 + idx - offset),
                                  child: Transform.scale(
                                    scale: 1 + idx - offset,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        
                                        ...data[idx]!.map(
                                          (e) => InnerItem(item: e, value: 1 + idx - offset,)),
                                        
                                      ],
                                    ),
                                  ),
                                );
                              }
                            ),
                          );
                        }
                      ),
                    ),
                  );
                }
              ),
                
              AnimatedBuilder(
                animation: header,
                builder: (_, __) {
                  return Transform.translate(
                    offset: Offset(0, header.value),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: (MediaQuery.of(context).size.height/3),
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("res/images/home_top_wave.png"), fit: BoxFit.fill)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomAppBar(
                              onMenuClick: (){
                                // scaffoldKey.currentState!.openEndDrawer();
                                showDialog(
                                  context: context, 
                                  // isScrollControlled: true,
                                  // backgroundColor: Colors.transparent,
                                  builder: (_){
                                    return const DrawerDialog();
                                    
                                  });
                              },
                            ),
                            // TagLine(),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Header(),
                                  SizedBox(height: SizeResponsive.getMin(context, 50),)
                                ],
                              ),
                            ),  
                            // Search()
                            // const SizedBox(height: 70,)
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
                
              Visibility(
                visible: !showForm,
                child: AnimatedBuilder(
                  animation: watermark,
                  builder: (_, __) {
                    return Positioned(
                      bottom: 0,
                      right: 0-watermark.value,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, bottom: 20),
                        child: Indicator(notifier: notifier,)),
                    );
                  }
                ),
              ),
                
                
              AnimatedBuilder(
                animation: button,
                builder: (_, __) {
                  return Transform.translate(
                    offset: Offset(0.0,  0.0-button.value),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: ()async{

                          // setState(() {
                          //   showForm = true;
                          // });
                          await Get.toNamed(Routes.booking);
                          // showModalBottomSheet(
                          //   isScrollControlled: true,
                          //   backgroundColor: Colors.transparent,
                          //   context: context, 
                          //   builder: (_){
                          //     return const ServicesSheet();
                          //     // return const DoctorsSheet();
                          //     // return const BookingSheet();
                          //   }); 

                          


                          
                        },
                        child: const StyledButton())),
                  );
                }
              ),

              AnimatedBuilder(
                animation: side2,
                builder: (_, val) {
                  return Positioned(
                    top: SizeResponsive.get(context, 160),
                    right: SizeResponsive.get(context, side2.value),
                    child: Transform.rotate(
                      angle: -90*(pi/180),
                      child: Container(
                        width: SizeResponsive.get(context, 280),
                        height: SizeResponsive.get(context, 75),
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("res/images/home_side.png"), fit: BoxFit.fill)
                        )
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}