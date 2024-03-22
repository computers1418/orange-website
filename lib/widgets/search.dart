import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin{

  late AnimationController _controller; 
  late Animation<double> animation;
  late Animation<double> animation2;
  late Animation<double> animation3;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween<double>(
      begin: 44,
      end: 0
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: Curves.easeIn,
    ));
     animation2 = Tween<double>(
      begin: 22,
      end: 20
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: Curves.easeIn,
    ));
    animation3 = Tween<double>(
      begin: 0,
      end: 4
    ).animate(CurvedAnimation(
      parent: _controller,
      reverseCurve: Curves.ease,
      curve: Curves.easeIn,
    ));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Stack(
        children: [
          InkWell(
            onTap: (){
              _controller.forward();
            },
            child: AnimatedBuilder(
              animation: animation,
              builder: (_, __) {
                return Container(
                  margin: EdgeInsets.only(right: animation.value),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0x33FFFFFF),
                    border: Border.all(color: const Color(0x0DFFFFFF)),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
                      BoxShadow(blurRadius: 10, color: Color(0x0DFFFFFF)  )
                    ]
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.white, size: 20,),
                      SizedBox(width: 6,),
                      Text("Search", style: TextStyle(
                      fontFamily: "Kumbhsans",
                      color: Color(0x80FFFFFF),
                      fontSize: 15,
                      height: 1,
                      fontWeight: FontWeight.w500
                    ))
                    ],
                  ),
                );
              }
            ),
          ),
          AnimatedBuilder(
            animation: animation2,
            builder: (_, __) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.all(animation3.value),
                  child: CircleAvatar(
                    radius: animation2.value,
                    backgroundColor: const Color(0xFF2B275A),
                    child: Icon(Icons.arrow_forward, color: Colors.white, size: 26-animation3.value),
                  ),
                ),
              );
            }
          )
        ],
      ),
    );
  }
}