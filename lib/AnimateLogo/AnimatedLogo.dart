import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: Image.asset("imgs/logo.png"),
        ),
      ),
    );
  }
}

//class AnimatedLogo extends AnimatedWidget {
//  AnimatedLogo({Key key, Animation<double> animation})
//      : super(key: key, listenable: animation);
//
//  @override
//  Widget build(BuildContext context) {
//    final Animation<double> animation = listenable;
//    return Center(
//      child: Container(
//        margin: const EdgeInsets.symmetric(vertical: 10),
//        height: animation.value,
//        width: animation.value,
//        child: FlutterLogo(),
//      ),
//    );
//  }
//}
