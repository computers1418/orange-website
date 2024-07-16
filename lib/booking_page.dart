import 'dart:math';
import 'package:dentist_india_plus/data.dart';
import 'package:dentist_india_plus/extensions/num_exten.dart';
import 'package:dentist_india_plus/utils.dart';
import 'package:dentist_india_plus/widgets/booking_form.dart';
import 'package:dentist_india_plus/widgets/doctor_instruction_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinput/pinput.dart';
import 'drawer/drawer_dialog.dart';
import 'drawer/home_drawer.dart';
import 'responsive/size_responsive.dart';
import 'responsive/text_responsive.dart';
import 'widgets/carousel_item.dart';
import 'widgets/custom_appbar2.dart';
import 'widgets/header2.dart';
import 'widgets/profile_address.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_info.dart';
import 'widgets/profile_tab.dart';
import 'widgets/reviews.dart';
import 'widgets/styled_button.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with TickerProviderStateMixin {
  late GlobalKey<ScaffoldState> scaffoldKey;

  ValueNotifier current = ValueNotifier(1);
  ValueNotifier type = ValueNotifier(1);
  ValueNotifier selectedDoctor = ValueNotifier(null);
  ValueNotifier showDoctor = ValueNotifier(false);

  late TextEditingController doctor;
  late TextEditingController dateTime;
  late TextEditingController name;
  late TextEditingController problem;
  late TextEditingController medicine;

  final PageController controller =
      PageController(viewportFraction: 0.8, initialPage: 0);

  late AnimationController _controller;

  late AnimationController _slidercontroller;
  late Animation<double> header;
  late Animation<double> bottom;
  late Animation<double> sheet;
  late Animation<double> topsheet;

  ValueNotifier showProfile = ValueNotifier(false);
  late AnimationController _bottomSheetController;
  late AnimationController _topSheetController;
  late Animation<Offset> slideClose;
  late Animation<double> profileBottom;
  late Animation<double> profileHeader;
  late Animation<double> side1;
  late Animation<double> side2;
  late Animation<double> side3;

  @override
  void initState() {
    scaffoldKey = GlobalKey();

    controller.addListener(() {
      current.value = controller.offset;
    });
    doctor = TextEditingController();
    dateTime = TextEditingController();
    name = TextEditingController();
    problem = TextEditingController();
    medicine = TextEditingController();

    // BOOKING PAGE

    _controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);
    header = Tween<double>(begin: -500, end: 0).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut,
    ));
    bottom = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: const Interval(
        0.0,
        0.6,
        curve: Curves.easeOut,
      ),
    ));
    _bottomSheetController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);

    sheet = Tween<double>(begin: -80, end: 0).animate(CurvedAnimation(
      parent: _bottomSheetController,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut,
    ));
    _topSheetController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    topsheet = Tween<double>(begin: -200, end: 0).animate(CurvedAnimation(
      parent: _topSheetController,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut,
    ));
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      controller.animateToPage(1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
    });

    // PROFILE PAGE
    _slidercontroller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this);

    slideClose =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-500, -30))
            .animate(CurvedAnimation(
      parent: _slidercontroller,
      reverseCurve: Curves.ease,
      curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
    ));
    profileBottom = Tween<double>(begin: -1000, end: 0).animate(CurvedAnimation(
      parent: _slidercontroller,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut,
    ));
    profileHeader = Tween<double>(begin: -500, end: 0).animate(CurvedAnimation(
      parent: _slidercontroller,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut,
    ));
    side1 = Tween<double>(begin: -30, end: -10).animate(CurvedAnimation(
      parent: _slidercontroller,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut,
    ));
    side2 = Tween<double>(begin: -200, end: -120).animate(CurvedAnimation(
      parent: _slidercontroller,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut,
    ));

    side3 = Tween<double>(begin: -200, end: -120).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut,
    ));

    super.initState();
  }

  openProfile(e) {
    controller.animateToPage(2,
        duration: const Duration(milliseconds: 400), curve: Curves.linear);
    _controller.reverse();
    _slidercontroller.forward();
    showProfile.value = true;
  }

  closeProfile() {
    _slidercontroller.reverse();
    Future.delayed(const Duration(milliseconds: 1300), () {
      controller.animateToPage(1,
          duration: const Duration(milliseconds: 400), curve: Curves.linear);
    });
    _controller.forward();
    showProfile.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const HomeDrawer(),
        backgroundColor: const Color(0xffff8412),
        body: Stack(
          children: [
            AnimatedBuilder(
                animation: profileHeader,
                builder: (_, val) {
                  return Transform.translate(
                    offset: Offset(0, profileHeader.value + 55),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      child: const Column(
                        children: [ProfileHeader(), Spacer(), ProfileInfo()],
                      ),
                    ),
                  );
                }),
            AnimatedBuilder(
                animation: profileBottom,
                builder: (_, val) {
                  return Transform.translate(
                    offset: Offset(0, profileBottom.value),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 2 - 10,
                          backgroundColor: const Color(0x1AFFFFFF),
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width / 3.3,
                            backgroundColor: const Color(0x1AFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: showDoctor,
                    builder: (_, enable, __) {
                      return ValueListenableBuilder(
                          valueListenable: showProfile,
                          builder: (_, val, __) {
                            return CustomAppBar2(
                              widget: Visibility(
                                visible: enable,
                                child: GestureDetector(
                                  onTap: () => _topSheetController.forward(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.asset(
                                      'res/images/down_circle.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ),
                              ),
                              closeIcon: val ? Icons.arrow_back : null,
                              onMenuClick: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => const DrawerDialog(),
                                );
                              },
                              onClose: () {
                                if (val) {
                                  closeProfile();
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                            );
                          });
                    }),
                AnimatedBuilder(
                    animation: header,
                    builder: (_, __) {
                      return Transform.translate(
                        offset: Offset(0, header.value),
                        child: const Header2(),
                      );
                    }),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: current,
                    builder: (_, val, __) {
                      return Stack(
                        children: [
                          AnimatedBuilder(
                            animation: slideClose,
                            builder: (_, val) {
                              return Transform.rotate(
                                angle: slideClose.value.dy * (pi / 180),
                                child: Transform.translate(
                                  offset: Offset(slideClose.value.dx, 0),
                                  child: PageView.builder(
                                    itemCount: 3,
                                    controller: controller,
                                    itemBuilder: (_, int itemIndex) {
                                      double angle = 0.0;
                                      double y = 0.0;

                                      var offset = itemIndex == 0
                                          ? controller.offset
                                          : controller.offset / itemIndex;
                                      var width =
                                          MediaQuery.of(context).size.width *
                                              0.8;

                                      if (itemIndex == 0) {
                                        angle = -convertToRange(offset);
                                        y = convertToRange2(offset);
                                      } else if (offset < width) {
                                        angle = convertToRange(width - offset);
                                        y = convertToRange2(width - offset);
                                      } else if (offset > width) {
                                        angle = -convertToRange(offset - width);
                                        y = convertToRange2(offset - width);
                                      }

                                      var pad10 =
                                          SizeResponsive.get(context, 10);
                                      var pad20 =
                                          SizeResponsive.get(context, 20);

                                      return Transform.translate(
                                        offset: Offset(0, y),
                                        child: Transform.rotate(
                                          angle: angle * (pi / 180),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                pad10, pad20, pad10, pad10),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                pad10,
                                                0,
                                                pad10,
                                                pad20,
                                              ),
                                              child: const CarouselItem(),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Read Client Reviews",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                        TextResponsive.getResponsiveFontSize(
                                            context, 10),
                                    fontFamily: "Kumbhsans",
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: SizeResponsive.get(context, 10),
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: MediaQuery.of(context).size.height >= 800 &&
                      MediaQuery.of(context).size.width < 450,
                  child: const SizedBox(
                    height: 20,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                AnimatedBuilder(
                  animation: sheet,
                  builder: (_, val) {
                    return AnimatedBuilder(
                      animation: bottom,
                      builder: (_, val) {
                        return Transform.scale(
                          scale: bottom.value,
                          alignment: Alignment.bottomCenter,
                          child: BookingForm(
                            onSelected: () {
                              _topSheetController.forward();
                            },
                            dateTime: dateTime,
                            problem: problem,
                            doctor: doctor,
                            bottomSheetController: _bottomSheetController,
                            sheet: sheet.value,
                            showDoctor: showDoctor,
                            selectedDoctor: selectedDoctor,
                            openProfile: openProfile,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            AnimatedBuilder(
              animation: profileBottom,
              builder: (_, __) {
                return Positioned(
                  bottom: profileBottom.value,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50)),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(right: 16, left: 40),
                            child: ProfileAddress()),
                        8.vgap(),
                        const Expanded(child: ProfileTab()),
                        const Expanded(child: Reviews()),
                        26.vgap(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => closeProfile(),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height > 700
                                            ? SizeResponsive.get(context, 60)
                                            : SizeResponsive.get(context, 45),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(34),
                                      border: Border.all(
                                        width: 2,
                                        color: const Color(0x332B275A),
                                      ),
                                    ),
                                    child: Text(
                                      "BACK",
                                      style: TextStyle(
                                        color: const Color(0x332B275A),
                                        fontWeight: FontWeight.w700,
                                        fontSize: TextResponsive
                                            .getResponsiveFontSize(
                                          context,
                                          18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              16.hgap(),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    _slidercontroller.reverse();
                                    Future.delayed(
                                        const Duration(milliseconds: 1300), () {
                                      controller.animateToPage(1,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.linear);
                                    });
                                    _controller.forward();
                                    selectedDoctor.value = doctors.first;
                                    doctor.setText(
                                      selectedDoctor.value!['name'],
                                    );
                                    showProfile.value = false;
                                  },
                                  child: StyledButton(
                                    text: "SELECT",
                                    secondary:
                                        MediaQuery.of(context).size.height > 700
                                            ? false
                                            : true,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: side2,
              builder: (_, val) {
                return Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.5,
                  left: SizeResponsive.get(context, side2.value),
                  child: Transform.rotate(
                    angle: 90 * (pi / 180),
                    child: Container(
                      width: SizeResponsive.get(context, 260),
                      height: SizeResponsive.get(context, 75),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("res/images/home_side.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: side3,
              builder: (_, val) {
                return Positioned(
                  top: SizeResponsive.get(context, 100),
                  right: SizeResponsive.get(context, side3.value),
                  child: Transform.rotate(
                    angle: -90 * (pi / 180),
                    child: Container(
                      width: SizeResponsive.get(context, 260),
                      height: SizeResponsive.get(context, 75),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("res/images/home_side.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: topsheet,
              builder: (_, val) {
                return Positioned(
                  top: topsheet.value,
                  right: 0,
                  left: 0,
                  child: GestureDetector(
                    onTap: () {
                      _topSheetController.reverse();
                      showDoctor.value = false;
                    },
                    child: DoctorinstructionCard(
                      showProfile: showProfile,
                      closeCard: () {
                        _topSheetController.reverse();
                      },
                      closeProfile: () {
                        closeProfile();
                      },
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
