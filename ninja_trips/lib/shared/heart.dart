import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  var _isFav = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curve;

  @override
  void initState() {
    super.initState();

    // 1. initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    // 2. initialize animation with AnimationController
    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_curve);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30),
          weight: 50,
        ),
      ],
    ).animate(_curve);

    // Control
    _controller.addListener(() {
      debugPrint('${_controller.value}');
      debugPrint('${_colorAnimation.value}');
    });

    _controller.addStatusListener((status) {
      // if (status == AnimationStatus.completed) {
      //   setState(() {
      //     _isFav = true;
      //   });
      // }
      // if (status == AnimationStatus.dismissed) {
      //   setState(() {
      //     _isFav = false;
      //   });
      // }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 3. Wrap Widget with AnimatedBuilder
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            _isFav ? _controller.reverse() : _controller.forward();
            setState(() {
              _isFav = !_isFav;
            });
          },
        );
      },
    );
  }
}
