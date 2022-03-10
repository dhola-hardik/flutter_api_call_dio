import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/res/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackArrow;
  final bool showLeadingArrow;
  final bool showTitleSpacing;
  final bool centerTitle;
  final double elevation;
  final Color? backgroundColor;
  final Color? backIconColor;
  final Widget? leading;
  final List<Widget>? actionsWidget;
  final TextStyle? titleStyle;

  @override
  Size get preferredSize => AppBar()
      .preferredSize; // Size.fromHeight(kToolbarHeight); // Size.fromHeight(34);

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.showBackArrow = false,
    this.showLeadingArrow = true,
    this.showTitleSpacing = false,
    this.centerTitle = false,
    this.elevation = 0,
    this.leading,
    this.backgroundColor,
    this.actionsWidget,
    this.titleStyle,
    this.backIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackArrow,
      backgroundColor: backgroundColor ?? appColor.main,
      elevation: elevation,
      centerTitle: centerTitle,
      title: Text(title,
          style: titleStyle ??
              TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 48.sp)),
      titleSpacing: showTitleSpacing ? 20 : 5,
      leading: showLeadingArrow
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : leading,
      actions: actionsWidget,
    );
  }
}
