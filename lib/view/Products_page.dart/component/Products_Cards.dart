import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FullCard extends StatelessWidget {
  FullCard({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;
  ProductsResponse? product;
  var favorite = false.obs;
  var cart = false.obs;
  var counter = 0.obs;
  var cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(right: Defaults.defaultPadding / 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.transparent,
          ),
          child: Container(
            margin: EdgeInsets.only(top: Defaults.defaultPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(children: [
                  Container(
                    height: size.height * 0.14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            product!.avatar!,
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(5.0),
                        topRight: const Radius.circular(5.0),
                      ),
                    ),
                  ),
                  Obx(() => IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          favorite.value
                              ? favorite.value = false
                              : favorite.value = true;
                        },
                        icon: Icon(
                          favorite.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: AppColors.whiteColor,
                          size: 30,
                        ),
                      ))
                ]),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Defaults.defaultPadding / 2),
                          child: Text(product!.name!),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(
                            left: Defaults.defaultPadding / 2,
                            top: Defaults.defaultPadding / 2,
                          ),
                          child: Text(product!.type!),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(() => IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                cart.value
                                    ? cart.value = false
                                    : cart.value = true;
                              },
                              icon: SvgPicture.asset(
                                'assets/svg/Cart icon.svg',
                                color: cart.value
                                    ? AppColors.mainColor
                                    : AppColors.greyColor,
                                width: 40,
                              ),
                            )),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsets.only(
                            right: Defaults.defaultPadding / 2,
                            top: Defaults.defaultPadding / 2,
                          ),
                          child: Text('${product!.price!}\$'),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: GetBuilder<ProductsController>(builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => counter++,
                  child: Container(
                    margin:
                        EdgeInsets.only(bottom: Defaults.defaultPadding / 2),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(10, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: Defaults.defaultPadding / 2),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(10, 10), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Obx(() {
                    return Center(
                      child: Text('${counter.value}'),
                    );
                  }),
                ),
                InkWell(
                  onTap: () {
                    if (counter > 0) {
                      counter--;
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(10, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ],
    );
  }
}
