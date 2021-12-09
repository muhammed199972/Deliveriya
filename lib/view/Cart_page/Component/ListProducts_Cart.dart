import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/controller/Cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProdCart extends StatelessWidget {
  const ListProdCart({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller.listScrollController,
        itemCount: 12,
        itemBuilder: (context, index) {
          var counter = 0.obs;

          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/png/logo.png',
                      width: 40,
                    ),
                    Text('Fruits'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (counter > 0) {
                          counter--;
                        }
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 2,
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
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Obx(() {
                        return Center(
                          child: Text('${counter.value}'),
                        );
                      }),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () => counter++,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: AppColors.whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
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
                  ],
                ),
                Row(
                  children: [
                    Text('${index + 1} \$'),
                    IconButton(
                      splashColor: Colors.transparent,
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/png/remove.png',
                        width: 50,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
