import 'package:delivery_food/view/Home_page/component/Statuses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: ListView(
          children: [
            Container(
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Statuses(),
                      ),
                    );
                  },
                  child: Text('muhammed')),
            ),
          ],
        ));
  }
}
