import 'package:delivery_food/controller/Statuses_all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story_view/story_view.dart';

class Statuses extends StatelessWidget {
  bool statusebool = true;
  String? typeclass;
  Statuses({this.typeclass});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: WillPopScope(
          onWillPop: () async => true,
          child: Stack(
            children: <Widget>[
              GetBuilder<StatusesController>(
                  init: StatusesController(),
                  builder: (statuse) {
                    if (statusebool) {
                      statusebool = false;
                      if (typeclass == 'logo') {
                        statuse.addStatusItems();
                      } else if (typeclass == 'New') {
                        statuse.getAds();
                      } else if (typeclass == 'Offers') {
                        statuse.getoffers();
                      }
                    }
                    if (statuse.statusItems.length != 0) {
                      // box.write('statuse', statuse.statusItems);
                      // print(box.read('statuse'));
                      return Material(
                        type: MaterialType.transparency,
                        child: StoryView(
                          onStoryShow: (items) {
                            statuse.storeStatuses(items, typeclass!);
                          },
                          storyItems: statuse.statusItems,
                          controller: statuse.controller,
                          onComplete: typeclass == 'New'
                              ? statuse.handleCompletedNew
                              : typeclass == 'Offers'
                                  ? statuse.handleCompletedoffers
                                  : statuse.handleCompletedall,
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
          ),
        ));
  }
}
