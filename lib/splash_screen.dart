import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'main_screen.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashPage> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  AnimationStatusListener animationStatusListener;

  @override
  void initState() {
    super.initState();

    // 动画管理器
    controller = new AnimationController(
        duration: new Duration(milliseconds: 1500), vsync: this);

    // 动画
    animation = Tween(begin: 1.0, end: 0.5).animate(controller);

    animationStatusListener = (status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainPage()),
            (router) => router == null);
      }
    };

    // 注册动画观察者
    animation.addStatusListener((status) => animationStatusListener(status));

    // 启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: Image.asset(
        splashBackgroundImage,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void dispose() {
    controller.removeStatusListener(animationStatusListener);
    controller.dispose();
    super.dispose();
  }
}
