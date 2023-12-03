import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class BaseStatefulPage extends StatefulWidget {}

abstract class BaseStatefulState<Page extends BaseStatefulPage>
    extends State<Page> {
  // Widget params
  Widget body();
  AppBar? appbar() => null;
  Widget? floatingActionButton() => null;
  BottomNavigationBar? bottomNavigationBar() => null;

  // Page settings
  bool topSafeAreaEnabled() => true;
  bool bottomSafeAreaEnabled() => true;
  bool shouldShowLoading = false;
  Size size() => MediaQuery.of(context).size;
  double loadingIndicatorWidth() => size().width;
  double loadingIndicatorHeight() => size().height;

  Widget _widgetLoadingOverlay() {
    return Visibility(
      visible: shouldShowLoading,
      child: Container(
        width: loadingIndicatorWidth(),
        height: loadingIndicatorHeight(),
        color: Colors.transparent,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.amber,
      ),
      child: Scaffold(
        appBar: appbar(),
        body: SafeArea(
          top: topSafeAreaEnabled(),
          bottom: bottomSafeAreaEnabled(),
          child: Stack(children: [
            body(),
            _widgetLoadingOverlay(),
          ]),
        ),
        floatingActionButton: floatingActionButton(),
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }
}
