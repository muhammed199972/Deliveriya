import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/model/Category_model.dart';
import 'package:delivery_food/view/Home_page/component/category.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: Category(),
    );
  }
}
