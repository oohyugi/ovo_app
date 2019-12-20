import 'package:flutter/material.dart';

class CloningAnimation extends StatefulWidget {
  CloningAnimation(
      {Key key,
      this.size,
      this.itemBuilder})
      : super(key: key);

  final double size;
  final IndexedWidgetBuilder itemBuilder;

  @override
  _CloningAnimationState createState() {
    return _CloningAnimationState();
  }
}

class _CloningAnimationState extends State<CloningAnimation>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() => setState(() {}));

    _animation = Tween(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform(
                  transform: Matrix4.translationValues(
                      _animation.value *2, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white
                    ),
                      child: Icon(Icons.navigate_next,color: Theme.of(context).primaryColor,size: 18,)));
            }),

      ],
    );
  }


}
