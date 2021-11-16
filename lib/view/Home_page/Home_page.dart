import 'package:delivery_food/view/Home_page/component/Statuses.dart';
import 'package:delivery_food/view/Home_page/component/category.dart';
import 'package:delivery_food/view/Home_page/component/Search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: ListView(
          children: [
            CategoryComponent(),
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
            Container(
              child: FlatButton(
                  onPressed: () {
                    showSearch(context: context, delegate: Datasesrch());
                  },
                  child: Text('asfor')),
            ),
          ],
        ));
  }
}
