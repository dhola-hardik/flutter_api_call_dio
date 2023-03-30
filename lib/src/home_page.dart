import 'package:flutter/material.dart';
import 'package:flutter_api_call_dio/res/app_color.dart';
import 'package:flutter_api_call_dio/utils/my_application.dart';
import 'package:flutter_api_call_dio/utils/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/log_util.dart';
import '../widgets/custom_progress_view.dart';
import '../widgets/keep_alive_page.dart';
import 'tabs/home_tab.dart';
import 'tabs/movie_tab.dart';
import 'widgets/item_bottom_bar.dart';

final title = "HomePage";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _pageController = PageController(initialPage: 0);
  final _indexNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    app.appController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFAB(),
      bottomNavigationBar: _buildBottomBar(),
    );

    return Obx(() {
      return CustomProgressView(
        isLoading: app.appController.isLoading,
        child: Scaffold(
          extendBody: true,
          body: _buildBody(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: _buildFAB(),
          bottomNavigationBar: _buildBottomBar(),
        ),
      );
    });
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.black,
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildBottomBar() {
    return Obx(() {
      return Container(
        height: 150.h,
        color: appColor.transparent,
        child: BottomAppBar(
          color: appColor.primaryColor,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ItemBottomBar(
                icon: Icons.home_outlined,
                selected: app.appController.selectedTabIndex == 0,
                onPressed: () {
                  _openTab(0);
                },
              ),
              ItemBottomBar(
                icon: Icons.favorite_outline_rounded,
                selected: app.appController.selectedTabIndex == 1,
                showBadge: true,
                badgeValue: app.appController.favCount,
                onPressed: () {
                  _openTab(1);
                },
              ),
              WidgetUtil.spaceHorizontal(100),
              ItemBottomBar(
                icon: Icons.shopping_cart_outlined,
                selected: app.appController.selectedTabIndex == 2,
                onPressed: () {
                  _openTab(2);
                },
              ),
              ItemBottomBar(
                icon: Icons.video_collection_outlined,
                selected: app.appController.selectedTabIndex == 3,
                onPressed: () {
                  _openTab(3);
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index) {
        Log.loga(title, "onPageChanged:: index >>>>> $index");
      },
      children: [
        KeepAlivePage(child: HomeTab()),
        KeepAlivePage(child: Container()),
        KeepAlivePage(child: Container()),
        KeepAlivePage(child: MovieTab()),
      ],
    );
  }

  void _openTab(int index) {
    _pageController.jumpToPage(index);
    app.appController.onTabChanged(index);
    // _indexNotifier.value = index;
  }
}
