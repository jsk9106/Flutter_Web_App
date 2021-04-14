import 'package:flutter/material.dart';
import 'package:flutter_web_app/controller/screen_layout_controller.dart';
import 'package:get/get.dart';

class FlutterContent extends GetView<ScreenLayoutController> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '플러터',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: controller.type.value == ScreenSizeType.MOBILE
                    ? TextAlign.center
                    : TextAlign.left,
              ),
              SizedBox(height: 15),
              Text(
                '기가맥히지',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: controller.type.value == ScreenSizeType.MOBILE
                    ? TextAlign.center
                    : TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
