import 'package:delivery_food/General/Constants.dart';

import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/controller/Search_controller.dart';
import 'package:delivery_food/view/Home_page/component/Filter_Search.dart';
import 'package:delivery_food/view/Products_page.dart/component/Products_Cards.dart';
import 'package:delivery_food/view/Products_page.dart/component/Products_CardSearch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class Datasesrch extends SearchDelegate<String> {
  var prodController = Get.find<ProductsController>();
  StatusCode statusCode = StatusCode();
  var searchController = Get.put(SearchController());
  String q = '';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
            color: AppColors.mainColor,
          ),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.mainColor,
        ),
        onPressed: () {
          close(context, '');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (query != '') {
      bool isem = true;
      var SearchHome = Constansbox.box.read('SearchHome');
      for (int i = 0; i < SearchHome.length; i++) {
        if (SearchHome[i] == query) {
          isem = false;
        }
      }
      if (isem) {
        SearchHome.add(query);

        Constansbox.box.write('SearchHome', SearchHome);
      }
    }
    return GetBuilder<ProductsController>(
        init: ProductsController(),
        builder: (products) {
          if (q != query) {
            products.getproduct(
                subCategoryId: '', offset: 0, limit: 50, q: query);
          }
          q = query;
          return Obx(() {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: Defaults.defaultPadding),
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                crossAxisCount: 3,
                itemCount: prodController.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return FullCardSearch(
                    size: size,
                    product: prodController.products[index],
                  );
                },
                staggeredTileBuilder: (int index) => new StaggeredTile.count(
                    1, size.height >= 650 ? 1.22 : 1.18),
                mainAxisSpacing: 1,
                crossAxisSpacing: 10,
              ),
            );
          });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (query.isEmpty) {
      return Obx(() {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: searchController.SearchHome.length,
          itemBuilder: (context, int index) => Container(
            height: size.height * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              border: Border.all(
                color: AppColors.darkgreyColor,
                width: 0.5,
              ),
            ),
            // margin: EdgeInsets.only(
            //     left: Defaults.defaultPadding / 4,
            //     right: Defaults.defaultPadding / 1.5),
            child: InkWell(
              onTap: () {
                query = searchController.SearchHome[index];
              },
              child: Padding(
                padding: statusCode.Lang == 'en'
                    ? EdgeInsets.only(left: 20.0)
                    : EdgeInsets.only(right: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          searchController.SearchHome[index],
                          style: size.width >= 600
                              ? Styles.defualttab
                              : Styles.defualtmobile,
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: AppColors.mainColor,
                          ),
                          onPressed: () {
                            searchController.SearchHome.removeAt(index);
                          })
                    ]),
              ),
            ),
          ),
        );
      });
    } else {
      return GetBuilder<ProductsController>(
          init: ProductsController(),
          builder: (products) {
            if (q != query) {
              products.getproduct(
                  subCategoryId: '', offset: 0, limit: 50, q: query);
            }
            q = query;
            return Obx(() {
              return Container(
                margin:
                    EdgeInsets.symmetric(horizontal: Defaults.defaultPadding),
                child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  itemCount: prodController.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FullCardSearch(
                      size: size,
                      product: prodController.products[index],
                    );
                  },
                  staggeredTileBuilder: (int index) => new StaggeredTile.count(
                      1, size.height >= 650 ? 1.22 : 1.18),
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 10,
                ),
              );
            });
          });
    }
  }
}
