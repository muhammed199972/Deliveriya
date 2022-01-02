import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Offer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOfferCart extends StatelessWidget {
  const ListOfferCart({
    Key? key,
    required this.offerController,
    required this.size,
    required this.statusCode,
  }) : super(key: key);

  final OfferController offerController;
  final Size size;
  final StatusCode statusCode;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: offerController.offersuser.length,
        itemBuilder: (context, int index) {
          var counter = offerController.offersuser[index].quantity!.obs;

          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 10), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.delete_outline,
                                          size: 30, color: AppColors.mainColor),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (counter <
                                                offerController
                                                    .offersuser[index].max!) {
                                              counter = counter +
                                                  offerController
                                                      .offersuser[index].min!;
                                              offerController.patchofferuser(
                                                  counter.value.toString(),
                                                  offerController
                                                      .offersuser[index].id
                                                      .toString());
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                right: Defaults.defaultPadding /
                                                    3.5),
                                            height: size.width <= 350
                                                ? 25
                                                : (size.width >= 600 ? 40 : 27),
                                            width: size.width <= 350
                                                ? 25
                                                : (size.width >= 600 ? 40 : 27),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3.0),
                                              color: AppColors.whiteColor,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 1,
                                                  blurRadius: 10,
                                                  offset: Offset(0,
                                                      0), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: size.width <= 350
                                                      ? 25
                                                      : (size.width >= 600
                                                          ? 40
                                                          : 25),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: Defaults.defaultPadding /
                                                  3.5),
                                          height: size.width >= 600 ? 40 : 30,
                                          width: size.width <= 350
                                              ? 25
                                              : (size.width >= 600 ? 40 : 37),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: AppColors.whiteColor,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 10,
                                                offset: Offset(0,
                                                    0), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Obx(() {
                                            return Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4, right: 4),
                                                child: Column(children: [
                                                  Expanded(
                                                    child: Text(
                                                      '${counter.value}',
                                                      style: TextStyle(
                                                        fontSize:
                                                            (size.width >= 600
                                                                ? 27
                                                                : 17),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                              ),
                                            );
                                          }),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (counter.value >
                                                offerController
                                                    .offersuser[index].min!) {
                                              counter = counter -
                                                  offerController
                                                      .offersuser[index].min!;
                                              offerController.patchofferuser(
                                                  counter.value.toString(),
                                                  offerController
                                                      .offersuser[index].id
                                                      .toString());
                                            }
                                          },
                                          child: Container(
                                              height: size.width <= 350
                                                  ? 25
                                                  : (size.width >= 600
                                                      ? 40
                                                      : 27),
                                              width: size.width <= 350
                                                  ? 25
                                                  : (size.width >= 600
                                                      ? 40
                                                      : 27),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3.0),
                                                color: AppColors.whiteColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                    spreadRadius: 1,
                                                    blurRadius: 10,
                                                    offset: Offset(0,
                                                        0), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: size.width <= 350
                                                        ? 25
                                                        : (size.width >= 600
                                                            ? 40
                                                            : 27),
                                                  ),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: RichText(
                                        text: TextSpan(
                                            style: size.width >= 600
                                                ? Styles.defualttab
                                                : Styles.defualtmobile,
                                            text: offerController
                                                .offersuser[index].description),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Obx(() => Column(
                                          children: [
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RichText(
                                                  text: TextSpan(
                                                      style: size.width >= 600
                                                          ? Styles.defualttab
                                                          : Styles
                                                              .defualtmobile,
                                                      text: (offerController
                                                                  .offersuser[
                                                                      index]
                                                                  .afterPrice! *
                                                              counter.value)
                                                          .toString()),
                                                )),
                                            RichText(
                                              text: TextSpan(
                                                  style: size.width >= 600
                                                      ? TextStyle(
                                                          color: AppColors
                                                              .mainColor,
                                                          fontSize: 25)
                                                      : TextStyle(
                                                          color: AppColors
                                                              .mainColor,
                                                          fontSize: 16,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                  text: (offerController
                                                              .offersuser[index]
                                                              .beforePrice! *
                                                          counter.value)
                                                      .toString()),
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: size.height / 5,
                      width: size.width / 3,
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                        statusCode.urlimage +
                            offerController.offersuser[index].media!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
