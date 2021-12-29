import 'package:bot_toast/bot_toast.dart';
import 'package:delivery_food/General/Constants.dart';
import 'package:delivery_food/General/Dialogs.dart';
import 'package:delivery_food/controller/Address_controller.dart';
import 'package:delivery_food/controller/Order_controller.dart';
import 'package:delivery_food/view/Profile_page/Component/AddressWidget.dart';
import 'package:delivery_food/view/Profile_page/Component/TextField.dart';
import 'package:delivery_food/view/Virefy_pages/Component/Buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ConfirmCart extends StatelessWidget {
  ConfirmCart({
    Key? key,
  }) : super(key: key);
  var controller = Get.put(AddressController());
  var co = Get.find<OrderController>();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var data = Map().obs;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteappbarColor,
        elevation: 1,
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
          'infoorder'.tr,
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(
                      context,
                      minTime: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                      ),
                      maxTime: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day + 7,
                      ),
                      onConfirm: (time) {
                        _dateController.text = time.toString().substring(0, 10);
                      },
                    );
                  },
                  child: TextFieldProfwidget(
                    controller: _dateController,
                    enabled: false,
                    // validator: validate,
                    lebel: 'setdelivarytime'.tr,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: InkWell(
                  onTap: () {
                    DatePicker.showTime12hPicker(
                      context,
                      onConfirm: (time) {
                        _timeController.text =
                            time.toString().substring(10, 16);
                      },
                    );
                  },
                  child: TextFieldProfwidget(
                    controller: _timeController,
                    enabled: false,
                    // validator: validate,
                    lebel: 'setdelivarydate'.tr,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: InkWell(
                  onTap: () {},
                  child: TextFieldProfwidget(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(9),
                    ],
                    // validator: validateMobile,
                    controller: _phoneController,
                    lebel: 'phone'.tr,
                    prefixtxt: '+963',
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  DialogsUtils.showdialogAddress();
                },
                child: Obx(() => AddressWidget(
                      size: size,
                      icon: SvgPicture.asset('assets/svg/address.svg'),
                      txt: controller.data.value.town == null
                          ? 'addaddress'.tr
                          : '${controller.data.value.town?.city?.name}-${controller.data.value.town?.name}',
                      subtitle: controller.data.value.town == null
                          ? ''
                          : controller.data.value.locationDescription,
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 50),
                child: ButtonWidget2(
                    size: size,
                    txt: 'submit'.tr,
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        if (_dateController.text == '' ||
                            _timeController.text == '' ||
                            controller.data.value.town == null) {
                          BotToast.showText(
                            text: 'some info need complete',
                            align: Alignment.center,
                          );
                        } else {
                          var body = _phoneController.text != ''
                              ? {
                                  'date':
                                      '${DateTime.parse(_dateController.text + _timeController.text)}',
                                  'phone': _phoneController.text,
                                  'AddressId':
                                      controller.data.value.id.toString(),
                                }
                              : {
                                  'date':
                                      '${DateTime.parse(_dateController.text + _timeController.text)}',
                                  'AddressId':
                                      controller.data.value.id.toString(),
                                };
                          co.postOrder(body);
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // String? validate(String? value) {
  //   if (value!.length == 0)
  //     return 'Please enter value';
  //   else
  //     return null;
  // }

  String? validateMobile(String? value) {
    if (value!.length == 0)
      return 'Please enter PhoneNumber';
    else if (value.startsWith('0', 0)) {
      return 'enter like 9********';
    } else
      return null;
  }
}
