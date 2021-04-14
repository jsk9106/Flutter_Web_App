import 'package:flutter/material.dart';
import 'package:flutter_web_app/controller/screen_layout_controller.dart';
import 'package:flutter_web_app/screen/components/root_content.dart';
import 'package:flutter_web_app/template/default_template.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTemplate(
      contents: RootContent(),
    );
  }
}
