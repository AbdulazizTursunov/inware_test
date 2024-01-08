import 'package:flutter/material.dart';


class ShadowColor extends StatelessWidget {
  const ShadowColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 200+200,
          width: 200+50,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal),
            borderRadius:const BorderRadius.only(topLeft: Radius.circular(16),bottomRight: Radius.circular(20)),
            color: Colors.blue,
            gradient: const LinearGradient(
              colors: [Colors.purple, Colors.blueAccent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.4, 0.7],
              tileMode: TileMode.repeated,
            ),
            boxShadow:const  [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0,1),
                blurRadius: 15,
                spreadRadius: 0.7
              ),
            ],
          ),
        ),
      ),
    );
  }
}
