import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/utils/my_application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/app_color.dart';

class ItemBottomBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final bool showBadge;
  final int badgeValue;
  final VoidCallback onPressed;

  ItemBottomBar({
    required this.icon,
    this.selected = false,
    this.showBadge = false,
    this.badgeValue = 0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget _tabIcon = Container(
      decoration: BoxDecoration(color: selected ? Colors.white24 : Colors.transparent, shape: BoxShape.circle),
      child: IconButton(onPressed: onPressed, iconSize: 70.w, icon: Icon(icon)),
    );

    if (showBadge) {
      return badges.Badge(
        position: badges.BadgePosition.topEnd(top: 10.w, end: 10.w),
        badgeAnimation: const badges.BadgeAnimation.scale(
          animationDuration: Duration(milliseconds: 300),
          colorChangeAnimationDuration: Duration(seconds: 1),
        ),
        badgeStyle: const badges.BadgeStyle(badgeColor: Colors.pinkAccent),
        showBadge: app.appController.productsList.isNotEmpty && badgeValue > 0,
        badgeContent: Text(
          '$badgeValue',
          style: TextStyle(fontSize: 32.sp, color: appColor.white, fontWeight: FontWeight.w700),
        ),
        child: _tabIcon,
      );
    }

    return _tabIcon;
  }
}
