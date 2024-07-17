import 'package:dentist_india_plus/extensions%20copy/number_exten.dart';
import 'package:flutter/material.dart';
import '../drawer/drawer_dialog.dart';
import 'custom_appbar2.dart';

class DoctorinstructionCard extends StatelessWidget {
  final ValueNotifier showProfile;
  final VoidCallback closeProfile;
  final VoidCallback closeCard;
  const DoctorinstructionCard(
      {super.key,
      required this.showProfile,
      required this.closeProfile,
      required this.closeCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('res/images/top_frame.png'), fit: BoxFit.fill)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
              valueListenable: showProfile,
              builder: (_, val, __) {
                return CustomAppBar2(
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
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Doctor’s Instruction",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Kumbhsans",
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Dr. Veronica Smith",
                      style: TextStyle(
                        color: Color(0xFFFFA34E),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Kumbhsans",
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                10.h(),
                Text(
                  'Korem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. consectetur adipiscing elit. Nunc vulputate libero et velit interdum.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kumbhsans",
                    fontSize: 10,
                  ),
                ),
                10.h(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: GestureDetector(
                    onTap: () => closeCard(),
                    child: const Icon(
                      Icons.arrow_drop_up_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
