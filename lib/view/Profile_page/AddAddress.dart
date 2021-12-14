import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/view/Profile_page/Component/TextField.dart';
import 'package:delivery_food/view/Virefy_pages/Component/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  AddAddress({Key? key}) : super(key: key);
  List<Map<String, dynamic>> statesList = [
    {'id': 1, 'name': 'aaaaaa'},
    {'id': 2, 'name': 'bbbbb'}
  ];
  final _streetController = TextEditingController();
  final _phoneController = TextEditingController();
  final _detailedController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.blackColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Add address',
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                            value: '1',
                            iconSize: 30,
                            icon: (null),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                            hint: Text('Select State'),
                            onChanged: (String? newValue) {
                              // setState(() {
                              //   _myState = newValue;
                              //   _getCitiesList();
                              //   print(_myState);
                              // });
                            },
                            items: statesList.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['name']),
                                value: item['id'].toString(),
                              );
                            }).toList()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                            value: '1',
                            iconSize: 30,
                            icon: (null),
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                            hint: Text('Select State'),
                            onChanged: (String? newValue) {
                              // setState(() {
                              //   _myState = newValue;
                              //   _getCitiesList();
                              //   print(_myState);
                              // });
                            },
                            items: statesList.map((item) {
                              return new DropdownMenuItem(
                                child: new Text(item['name']),
                                value: item['id'].toString(),
                              );
                            }).toList()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: TextFieldProfwidget(
                controller: _streetController,
                validator: validateMobile,
                lebel: 'Street',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: TextFieldProfwidget(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(9),
                ],
                validator: validateMobile,
                controller: _phoneController,
                lebel: 'Phone Number',
                prefixtxt: '+963',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: TextFieldProfwidget(
                h: 100,
                lines: 5,
                controller: _detailedController,
                validator: validateMobile,
                lebel: 'Detailed address',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 150),
              child: ButtonWidget2(size: size, txt: 'Submit', onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }

  String? validateMobile(String? value) {
    if (value!.length == 0)
      return 'Please enter PhoneNumber';
    else if (value.startsWith('0', 0)) {
      return 'enter like 9********';
    } else
      return null;
  }
}
