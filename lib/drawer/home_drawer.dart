import 'dart:math';

import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/drawer/drawer_list_item.dart';
import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:flutter/material.dart';

import '../responsive/size_responsive.dart';
import '../responsive/text_responsive.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> with TickerProviderStateMixin{

  late AnimationController controller;
  late AnimationController controller2;
  late ValueNotifier<String> isSelected;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this)..forward();
    controller2 = AnimationController(duration: const Duration(milliseconds: 700), vsync: this);
    isSelected = ValueNotifier('');
     animation = Tween<double>(
      begin: 1000,
      end: 0
    ).animate(CurvedAnimation(
      parent: controller2,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  
    return  Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width*0.8,
      child: Column(
        children: [
           AnimatedBuilder(
            animation: controller,
             builder: (_, val) {
               return Align(
                 alignment: Alignment.centerRight,
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                   child: GestureDetector(
                     onTap: ()=> Navigator.pop(context),
                     child: RotationTransition(
                       turns: Tween<double>(begin: 0.25, end: -0.25).animate(controller),
                       child: CircleAvatar(
                        radius: SizeResponsive.get(context, 18),
                        backgroundColor: const Color(0xFF2B275A),
                        child: const Icon(Icons.close, color: Colors.white, size: 16,),
                      ),
                     ),
                   ),
                 ),
               );
             }
           ),
           Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: SizeResponsive.get(context, 24),
                  backgroundColor: Colors.white,
                  backgroundImage: const AssetImage("res/images/placeholder.png"),
                ),
                16.hgap(),
                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello Welcome!", style: TextStyle(
                            fontFamily: "Kumbhsans",
                            color: const Color(0x802B275A),
                            fontSize: TextResponsive.getResponsiveFontSize(context, 16),
                            fontWeight: FontWeight.w500
                          )),
                      Text("Guest User", style: TextStyle(
                            fontFamily: "Kumbhsans",
                            color: const Color(0xFF2B275A),
                            fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                            fontWeight: FontWeight.w800
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [

                ...drawerItems.map((e){
                  if(drawerItems.indexOf(e)==2){
                    return InkWell(
                      onTap: (){

                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(12, 0, 12, 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF8412),
                          borderRadius: BorderRadius.circular(24)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14, 8, 8, 0),
                              child: Row(
                                children: [
                                  ImageIcon(AssetImage('${e["icon"]}'), size: 18, color: Colors.white,),
                                  8.hgap(),
                                  Text('${e["name"]}', style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: Colors.white,
                                    fontSize: TextResponsive.getResponsiveFontSize(context, 13),
                                    fontWeight: FontWeight.w800
                                  ))
                                ],  
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              padding: const EdgeInsets.fromLTRB(12, 6, 6, 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Text('21 Feb @ 11:00 am', style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: const Color(0xFF2B275A),
                                    fontSize: TextResponsive.getResponsiveFontSize(context, 15),
                                    fontWeight: FontWeight.w800
                                  )),
                                    Text('Dental Braces', style: TextStyle(
                                    fontFamily: "Kumbhsans",
                                    color: const Color(0xFFFF8412),
                                    fontSize: TextResponsive.getResponsiveFontSize(context, 12),
                                    fontWeight: FontWeight.w900
                                  )),
                                  const SizedBox(height: 6,),
                                   Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.room, size: 14, color: Color(0xFFFF8412),),
                                      const SizedBox(width: 4,),
                                       Expanded(
                                        child: Text('12/2, Mathura Road, Sector 37, Faridabad - Delhi', style: TextStyle(
                                          fontFamily: "Kumbhsans",
                                          color: const Color(0xFF2B275A),
                                          fontSize: TextResponsive.getResponsiveFontSize(context, 9),
                                          fontWeight: FontWeight.w600
                                        )),
                                      ),
                                      Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                           Padding(
                                            padding: const EdgeInsets.only(right:  18.0),
                                            child: CircleAvatar(
                                                radius: SizeResponsive.get(context, 16),
                                                backgroundColor: const Color(0xFF2B275A),
                                                child: Icon(Icons.arrow_forward, color: Colors.white, size: SizeResponsive.get(context, 18),),
                                              ),
                                          ),
                                            Transform.rotate(
                                              angle: -90*(pi/180),
                                              child: Text('MAP', style: TextStyle(
                                                  fontFamily: "Kumbhsans",
                                                  color: const Color(0xFF2B275A),
                                                  fontSize: TextResponsive.getResponsiveFontSize(context, 9),
                                                  fontWeight: FontWeight.w800
                                                )),
                                            )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 6,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Dr. Diana Cruz', style: TextStyle(
                                              fontFamily: "Kumbhsans",
                                              color: const Color(0xFF2B275A),
                                              fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                                              fontWeight: FontWeight.w800
                                            )),
                                            Text('BDS, MDS', style: TextStyle(
                                              fontFamily: "Kumbhsans",
                                              color: const Color(0xFF2B275A),
                                              fontSize: TextResponsive.getResponsiveFontSize(context, 9),
                                              fontWeight: FontWeight.w500
                                            )),
                                          ],
                                        ),
                                      ),
                                      Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                           Padding(
                                            padding: const EdgeInsets.only(right:  18.0),
                                            child: CircleAvatar(
                                                radius: SizeResponsive.get(context, 16),
                                                backgroundColor: const Color(0xFF2B275A),
                                                child: Icon(Icons.phone, color: Colors.white, size: SizeResponsive.get(context, 18),),
                                              ),
                                          ),
                                            Transform.rotate(
                                              angle: -90*(pi/180),
                                              child: Text('CALL', style: TextStyle(
                                                  fontFamily: "Kumbhsans",
                                                  color: const Color(0xFF2B275A),
                                                  fontSize: TextResponsive.getResponsiveFontSize(context, 9),
                                                  fontWeight: FontWeight.w800
                                                )),
                                            )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return ValueListenableBuilder(
                    valueListenable: isSelected,
                    builder: (_, val, __) {
                      return DrawerListItem(
                        icon: '${e["icon"]}', 
                        name: '${e["name"]}', 
                        path: e["path"],
                        selected: val,
                        onClick: (name){
                          isSelected.value = name;
                          if(name!=''){
                            controller2.forward();
                          }else{
                            controller2.reverse();
                          }
                        },
                      );
                    }
                  );
                }),

                AnimatedBuilder(
                  animation: animation,
                  builder: (_, val) {
                    return Transform.translate(
                      offset: Offset(0, animation.value),
                      child: Container(
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B275A),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Text("Download App to Access This Feature", style: TextStyle(
                          fontFamily: "Kumbhsans",
                          color: const Color(0xFFFFFFFF),
                          fontSize: TextResponsive.getResponsiveFontSize(context, 11),
                          fontWeight: FontWeight.w700
                        )),
                      ),
                    );
                  }
                )

              ],
            ),
          ),
          SizedBox(
            height: SizeResponsive.getHeightverse(context, 150),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset("res/images/bottom_wave.png", height: SizeResponsive.getHeightverse(context, 85),
                    fit: BoxFit.fill
                    )
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    children: [
                      Image.asset("res/images/mobile_app.png", width: SizeResponsive.getHeightverse(context, 80), ),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text("Download App Now!", style: TextStyle(
                                fontFamily: "KumbhsansSemiBold",
                                color: const Color(0xFF2B275A),
                                fontSize: TextResponsive.getResponsiveFontSize(context, 14),
                                fontWeight: FontWeight.w800
                              )),
                               SizedBox(
                                width: 200,
                                child: Text("Download now to experience all features, updates and immersive experiences.", 
                                maxLines: 4,
                                style: TextStyle(
                                  fontFamily: "Kumbhsans",
                                  color: const Color(0xFF2B275A),
                                  fontSize: TextResponsive.getResponsiveFontSize(context, 8),
                                  fontWeight: FontWeight.w400
                                )),
                              ),
                             SizedBox(height: SizeResponsive.get(context, 18),),
                            Row(
                              children: [
                        
                                Image.asset("res/images/playstore.png", width: SizeResponsive.get(context, 60), height: SizeResponsive.get(context, 26)),
                                const SizedBox(width: 10,),
                                Image.asset("res/images/appstore.png", width: SizeResponsive.get(context, 60), height: SizeResponsive.get(context, 26))
                        
                              ],
                            ),
                            const SizedBox(height: 8,)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}