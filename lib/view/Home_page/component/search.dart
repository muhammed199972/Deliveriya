import 'package:delivery_food/controller/Category_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/view/Home_page/component/Button_category_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Datasesrch extends SearchDelegate<String> {
  CategorysController categorys = Get.put(CategorysController());
  String q = '';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.red,
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
          color: Colors.red,
        ),
        onPressed: () {
          close(context, '');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return GetBuilder<ProductsController>(
        init: ProductsController(),
        builder: (products) {
          if (q != query) {
            products.getproduct('', 0, 50, query);
          }
          q = query;

          return ListView.builder(
              shrinkWrap: true,
              itemCount: products.products.length,
              itemBuilder: (context, i) {
                return Text(products.products[i].name.toString());
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Wrap(
          children: new List.generate(
              categorys.categorys.length,
              (index) => Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Button_category_search(
                        categorys.categorys[index].name.toString()),
                  )));
    } else {
      return GetBuilder<ProductsController>(
          init: ProductsController(),
          builder: (products) {
            if (q != query) {
              products.getproduct('', 0, 50, query);
            }
            q = query;

            return ListView.builder(
                shrinkWrap: true,
                itemCount: products.products.length,
                itemBuilder: (context, i) {
                  return Text(products.products[i].name.toString());
                });
          });
    }
  }
}
