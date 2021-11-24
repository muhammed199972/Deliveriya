import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:delivery_food/view/Products_page.dart/component/Products_Cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: Center(
          child: Text(
            'Favorite',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: Icon(
          Icons.arrow_back_rounded,
          color: Colors.transparent,
        ),
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.more_horiz,
                color: AppColors.blackColor,
              ),
              elevation: 1,
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("Sort by date"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Sort by category"),
                      value: 2,
                    ),
                  ])
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child:
                //  prodController.products.length == 0
                //     ?
                // Center(
                //     child: CircularProgressIndicator(),
                //   )
                // :
                Container(
              margin: EdgeInsets.symmetric(horizontal: Defaults.defaultPadding),
              child:
                  //  Obx(() {
                  //   return
                  StaggeredGridView.countBuilder(
                shrinkWrap: true,
                crossAxisCount: 2,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return FullCard(
                    size: size,
                    product: ProductsResponse(
                        price: 55,
                        type: 'aaaa',
                        name: 'test',
                        avatar:
                            'https://res.cloudinary.com/dh5mgn3vy/image/upload/w_600/public/user/default_user_xmbnjy.png'),
                  );
                },
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(1, 1.3),
                mainAxisSpacing: 25,
                crossAxisSpacing: 15,
              ),
              // }),
            ),
          )
        ],
      ),
    );
  }
}
