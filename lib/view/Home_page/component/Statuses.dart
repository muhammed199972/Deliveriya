import 'package:delivery_food/controller/Statuses_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:story_view/story_view.dart';

class Statuses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            GetBuilder<StatusesController>(
                init: StatusesController(),
                builder: (statuse) {
                  if (statuse.statusItems.length != 0) {
                    return Material(
                      type: MaterialType.transparency,
                      child: StoryView(
                        storyItems: statuse.statusItems,
                        controller: statuse.controller,
                        onComplete: statuse.handleCompleted,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                }),
            Positioned(
              bottom: 10,
              right: 160,
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        // shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.green,
                            width: 3.0,
                            style: BorderStyle.solid
                            // Color color = const Color(0xFF000000),
                            // double width = 1.0,
                            // BorderStyle style = BorderStyle.solid,
                            )),
                    child: Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Colors.green,
                      size: 40,
                    ),
                    // tooltip: 'Increase volume by 10',
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}