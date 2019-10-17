import 'package:flutter/material.dart';

class AnimatedFavoriteIcon extends StatefulWidget {
  final AnimationController animationController;

  AnimatedFavoriteIcon({@required this.animationController});

  @override
  _AnimatedFavoriteIconState createState() => _AnimatedFavoriteIconState();
}

class _AnimatedFavoriteIconState extends State<AnimatedFavoriteIcon> {
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.0, end: 1.3),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.3, end: 1.6),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.6, end: 1.3),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.3, end: 1.0),
          weight: 25.0,
        ),
      ],
    ).chain(CurveTween(curve: Curves.bounceInOut)).animate(widget.animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.animationController.reset();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Icon(
            Icons.favorite,
            color: colorAnimation(),
          ),
        );
      },
    );
  }

  Color colorAnimation() {
    return TweenSequence(
      <TweenSequenceItem<Color>>[
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFC1C1C1), end: Color(0xFFD29793)),
          weight: 16.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFD29793), end: Color(0xFFE36D64)),
          weight: 15.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFE36D64), end: Colors.red),
          weight: 16.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Colors.red, end: Color(0xFFE36D64)),
          weight: 17.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFE36D64), end: Color(0xFFD29793)),
          weight: 18.0,
        ),
        TweenSequenceItem<Color>(
          tween: ColorTween(begin: Color(0xFFD29793), end: Color(0xFFC1C1C1)),
          weight: 18.0,
        ),
      ],
    ).animate(widget.animationController).value;
  }
}
