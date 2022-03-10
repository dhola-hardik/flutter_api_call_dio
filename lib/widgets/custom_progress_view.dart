import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

import '../res/app_color.dart';

class CustomProgressView extends StatefulWidget {
  final bool isLoading;
  final double opacity;
  final Color backgroundColor;
  final Color? indicatorColor;
  Widget? progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  CustomProgressView({
    Key? key,
    @required this.isLoading = false,
    required this.child,
    this.opacity = 0.5,
    this.backgroundColor = Colors.black,
    this.progressIndicator,
    this.offset,
    this.dismissible = false,
    this.indicatorColor,
  })  : assert(child != null),
        assert(isLoading != null),
        super(key: key);

  @override
  _CustomProgressViewState createState() => _CustomProgressViewState();
}

class _CustomProgressViewState extends State<CustomProgressView> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) return widget.child;

    return WillPopScope(
      onWillPop: () async {
        return !widget.isLoading;
      },
      child: Stack(
        children: [
          widget.child,
          Opacity(
            opacity: widget.opacity,
            child: ModalBarrier(
              dismissible: widget.dismissible,
              color: widget.backgroundColor,
            ),
          ),
          _showProgress(context),
        ],
      ),
    );
  }

  Widget _showProgress(BuildContext context) {
    Widget layOutProgressIndicator;

    if (widget.progressIndicator == null) {
      widget.progressIndicator = Container(
        color: appColor.transparent,
        child: Center(
          child: SpinKitDoubleBounce(
              color: widget.indicatorColor ?? appColor.white, size: 50),
        ),
      );
    }

    if (widget.offset == null) {
      layOutProgressIndicator = Center(child: widget.progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        child: widget.progressIndicator!,
        left: widget.offset?.dx,
        top: widget.offset?.dy,
      );
    }
    return layOutProgressIndicator;
  }
}
