import 'package:flutter/material.dart';
import 'package:flutter_web_app/controller/screen_layout_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class NavigationMenu extends StatelessWidget {
  final ScreenSizeType screenSizeType;

  const NavigationMenu({Key? key, required this.screenSizeType}) : super(key: key);

  Widget menu(String menu, GestureTapCallback onTap){
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          menu,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Row _menuGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        menu('홈', () {
          Get.toNamed('/');
        }),
        menu('블로그', () {
          launch("https://github.com/jsk9106");
        }),
        menu('유튜브', () {
          launch("https://www.youtube.com/watch?v=IiuZeMXBGNU");
        }),
      ],
    );
  }

  Widget _mobileLayout(){
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 80,
          ),
          SizedBox(height: 20),
          _menuGroup(),
        ],
      ),
    );
  }

  Widget _desktopLayout(){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 80,
          ),
          _menuGroup(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch(screenSizeType){
      case ScreenSizeType.MOBILE:
        return _mobileLayout();
      case ScreenSizeType.TABLET:
        return _desktopLayout();
      case ScreenSizeType.DESKTOP:
        return _desktopLayout();
    }
  }
}
