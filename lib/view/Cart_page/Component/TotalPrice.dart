import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:delivery_food/controller/Products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TotalPrice extends StatelessWidget {
  TotalPrice({
    Key? key,
  }) : super(key: key);
  var cartController = Get.put(CartController());
  StatusCode statusCode = StatusCode();
  var prodController = Get.find<ProductsController>();
  var offerController = Get.find<OfferController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pricemcat = 0.obs;
    if (statusCode.Token == '') {
      List cart = prodController.cartscounte;
      if (cart != []) {
        List<int> cartscounte = [];
        cart.forEach((element) {
          cartscounte.add(element);
        });

        for (int k = 0; k < prodController.prods.length; k++) {
          for (int i = 0;
              i < prodController.prods[k].subCategories.length;
              i++) {
            for (int l = 0;
                l < prodController.prods[k].subCategories[i].products.length;
                l++) {
              if (prodController.prods.length != 0)
                pricemcat += (prodController
                        .prods[k].subCategories[i].products[l].price!) *
                    (cartscounte[k == 0
                        ? l
                        : prodController
                                .prods[k - 1].subCategories[i].products.length +
                            l]);
            }
          }
        }
      }
    }

    return Obx(() {
      if (statusCode.Token != '') {
        pricemcat.value = cartController.totalprice.value;
      }
      return Container(
        color: AppColors.whiteColor,
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: Defaults.defaultPadding),
        child: Row(
          children: [
            Text(
              'Total price :',
              style:
                  size.width >= 600 ? Styles.defualttab : Styles.defualtmobile,
            ),
            Spacer(),
            Center(
              child: statusCode.Token != ''
                  ? cartController.loadingtotal.value
                      ? (Text(
                          prodController.isTotal.value
                              ? '${NumberFormat.decimalPattern().format(pricemcat.value)} \$'
                              : '0',
                          style: size.width >= 600
                              ? Styles.defualttab
                              : Styles.defualtmobile))
                      : Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                  : Text(
                      prodController.isTotal.value
                          ? '${NumberFormat.decimalPattern().format(pricemcat.value)} \$'
                          : '0',
                      style: size.width >= 600
                          ? Styles.defualttab
                          : Styles.defualtmobile),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      );
    });
  }
}
