import 'package:flutter/material.dart';

class TapBounce extends StatefulWidget {
  const TapBounce({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback? onTap;
  final Widget child;

  @override
  State<TapBounce> createState() => _TapBounceState();
}

class _TapBounceState extends State<TapBounce>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    reverseDuration: const Duration(milliseconds: 100),
    value: 1.0,
    upperBound: 1.0,
    lowerBound: 0.8,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
    reverseCurve: Curves.decelerate,
  );

  double opacity = 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (widget.onTap != null) widget.onTap!();
    _controller.reverse().then((_) {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap != null ? _onTap : null,
      onTapUp: (details) {
        _controller.forward();
        setState(() {
          opacity = 1;
        });
      },
      onTapDown: (details) {
        _controller.reverse();
        setState(() {
          opacity = 0.5;
        });
      },
      onTapCancel: () {
        _controller.forward();
        setState(() {
          opacity = 1;
        });
      },
      child: ScaleTransition(
        scale: _animation,
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 100),
          child: widget.child,
        ),
      ),
    );
  }
}
