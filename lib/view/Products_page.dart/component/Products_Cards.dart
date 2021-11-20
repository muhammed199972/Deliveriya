import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/model/Products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FullCard extends StatelessWidget {
  FullCard({
    Key? key,
    required this.size,
    required this.product,
  }) : super(key: key);

  final Size size;
  ProductsResponse? product;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image: AssetImage(
                      product!.avatar!,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(5.0),
                  topRight: const Radius.circular(5.0),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: AppColors.whiteColor,
                size: 30,
              ),
            ),
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
                    padding: EdgeInsets.only(left: Defaults.defaultPadding / 2),
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
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/Cart icon.svg',
                      color: AppColors.greyColor,
                      width: 40,
                    ),
                  ),
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
    );
  }
}

class Buttons_plus_minus extends StatelessWidget {
  const Buttons_plus_minus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
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
          child: Center(
            child: Text('5'),
          ),
        ),
        Container(
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
        )
      ],
    );
  }
}
