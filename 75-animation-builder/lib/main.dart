import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {
  /*
  * animation typically typically have a sequence of numbers or a list of
  * numbers that you are going to modify over time, animation itself is the
  * individual number that changes over time
  *
  * animation controller is the time at which that sequence is changed
  * */
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 10000), vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0, end: 300.0).animate(curve);

    controller.forward();
  }

  Widget builder(BuildContext context, Widget child) {
    return Container(
        height: animation.value, width: animation.value, child: FlutterLogo());
  }

  // we need to dispose our controller once the animation is done otherwise it will chew up the battery and seems your app is hung up
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name here'),
      ),
      body: Container(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: AnimatedBuilder(animation: animation, builder: builder),
          )),
    );
  }
}
