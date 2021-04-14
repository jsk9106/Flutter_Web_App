import 'package:flutter/material.dart';
import 'package:flutter_web_app/controller/screen_layout_controller.dart';
import 'package:flutter_web_app/screen/components/footer.dart';
import 'package:flutter_web_app/screen/components/navigation_menu.dart';
import 'package:flutter_web_app/screen/components/right_menu.dart';
import 'package:get/get.dart';

class DefaultTemplate extends StatelessWidget {
  final Widget? contents;

  DefaultTemplate({required this.contents});

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  Widget _contentView() {
    List<Widget> list = [Expanded(child: contents!)];
    if (ScreenLayoutController.to.type.value != ScreenSizeType.MOBILE) {
      list.add(
        RightMenu(
            width: ScreenLayoutController.to.type.value == ScreenSizeType.TABLET
                ? 100
                : 150),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }

  Widget _layout({bool hasDrawer = false}) {
    return Scaffold(
      key: _key,
      drawer: hasDrawer
          ? Container(
              width: Get.size.width * 0.7,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: RightMenu(),
              ),
            )
          : null,
      body: Container(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 1280),
          child: Column(
            children: [
              Stack(
                children: [
                  ScreenLayoutController.to.type.value == ScreenSizeType.MOBILE
                      ? InkWell(
                          onTap: () {
                            _key.currentState?.openDrawer();
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            child: Icon(Icons.menu),
                          ),
                        )
                      : Container(),
                  NavigationMenu(
                      screenSizeType: ScreenLayoutController.to.type.value),
                ],
              ),
              Expanded(
                child: _contentView(),
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              ScreenLayoutController.to.builder(constraints);
              return Container();
            },
          ),
          Obx(() {
            switch (ScreenLayoutController.to.type.value) {
              case ScreenSizeType.MOBILE:
                return _layout(hasDrawer: true);
              case ScreenSizeType.TABLET:
                return _layout();
              case ScreenSizeType.DESKTOP:
                return _layout();
            }
          }),
        ],
      ),
    );
  }
}
