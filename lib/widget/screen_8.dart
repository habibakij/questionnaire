
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qus_survey/widget/text_widget.dart';
import '../common/style_management.dart';
import '../common/utils.dart';
import 'package:qus_survey/controller/page_controller.dart';
import 'package:get/get.dart';
import '../domain/database/data_store.dart';


class ScreenEight extends StatelessWidget {

  final moduleController= Get.put(ModuleController());

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    TextWidget.titleText("মডিউল ৮ঃ জন্ম সনংক্রান্ত (১০ বছর ও তদুর্ধ বয়সের জন্যে )", 0),
                    TextWidget.titleText("গত ৫ বছরে খানার যে সকল সদস্য বিদেশ থেকে ফেরত এসেছেন তাদের জন্য", 1),
                    /// question
                    TextWidget.singleQuestion(context, "Q 64: কেন দেশে ফেরত এসেছেন"),
                    TextWidget.questionFormWithTitle(context, "দেশের নাম", moduleController.m8CountryNameController.value, 0),
                    const SizedBox(height: 5),
                    TextWidget.questionFormWithTitle(context, "দেশের কোড", moduleController.m8CountryCodeController.value, 1),
                    TextWidget.singleQuestion(context, "Q 65: বিদেশ থেকে কখন ফেরত এসেছেন"),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [

                          const SizedBox(
                            width: 65,
                            child: Text(
                              "মাস",
                              style: StyleManagement.testStyleBlackBold12,
                              maxLines: 1,
                            ),
                          ),

                          m8Dropdown1(context),

                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextWidget.questionFormWithTitle(context, "বছর", moduleController.m8YearController.value, 1),
                    TextWidget.singleQuestion(context, "Q 66: বিদেশ থেকে ফেরত আসার প্রধান কারন কি"),
                    m8Dropdown2(context),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 10),
                  Utils.previousButton(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        widgetIndicator: Container(
                          height: 20,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            color: Colors.green,
                            border: Border.all(color: Colors.grey.withOpacity(.5)),
                          ),
                          child: Center(
                            child: Text(
                              "${moduleController.bottomGrossProgressing.value}%",
                              style: StyleManagement.testStyleWhite8,
                            ),
                          ),
                        ),
                        animation: true,
                        lineHeight: 3,
                         animationDuration: 500,
                        percent: moduleController.bottomGrossPercentage.value,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.green.withOpacity(.5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Utils.nextButton(),
                  const SizedBox(width: 10),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget m8Dropdown1(BuildContext context){
    return Container(
      height: 35,
      width: 180,
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 5),
            color: Colors.grey.withOpacity(.1),
            child: Obx(() => Text(
              moduleController.selectM8DropDrown2.value.toString(),
              style: StyleManagement.testStyleBlack12,
            )),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: const Color(0xFFB2BAFF)),
            ),
            child: DropdownButton(
              underline: const SizedBox(),
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black.withOpacity(.7),
              ),
              onChanged: (String? newValue) {
                moduleController.setSelectM8DropDrown2(newValue!);
              },
              items: DataStore.m8DropDrownList2.map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Text(
                    item.toString(),
                    style: StyleManagement.testStyleBlack12,
                  ),
                  onTap: (){},
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget m8Dropdown2(BuildContext context){
    return Container(
      height: 35,
      width: 255,
      margin: const EdgeInsets.only(left: 10),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 5),
            color: Colors.grey.withOpacity(.1),
            child: Obx(() => Text(
              moduleController.selectM8DropDrown1.value.toString(),
              style: StyleManagement.testStyleBlack12,
            )),
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: const Color(0xFFB2BAFF)),
            ),
            child: DropdownButton(
              underline: const SizedBox(),
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black.withOpacity(.7),
              ),
              onChanged: (String? newValue) {
                moduleController.setSelectM8DropDrown1(newValue!);
              },
              items: DataStore.m8DropDrownList1.map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Text(
                    item.toString(),
                    style: StyleManagement.testStyleBlack12,
                  ),
                  onTap: (){},
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }


}
