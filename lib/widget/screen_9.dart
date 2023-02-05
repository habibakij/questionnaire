
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qus_survey/widget/text_widget.dart';
import '../common/style_management.dart';
import '../common/utils.dart';
import 'package:get/get.dart';
import '../controller/page_controller.dart';
import '../domain/database/data_store.dart';

class ScreenNine extends StatelessWidget {

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
                    TextWidget.titleText("মডিউল ৯ঃ আন্তর্জাতিক মাইগ্রেশন", 0),
                    TextWidget.titleText("৫ বছর ও তদূর্ধ বয়সের লোকজন যারা খানার সদস্য ছিলেন কিন্তু ৬ মাস বা ততোধিক সময়য়ের জন্যে বিদেশে আছেন অথাবা থাকতে বিদেশে গেছেন", 1),
                    /// question
                    TextWidget.questionWithSubtitle(context, "Q 67: প্রবাসির নাম ", "(ইংরেজিতে বড় অক্ষরে ডাক নাম লিখেন)"),
                    TextWidget.questionForm(context, moduleController.m9NameController.value, 0),
                    TextWidget.singleQuestion(context, "Q 68: লিঙ্গ"),
                    selectGender(),
                    genderText(),
                    TextWidget.questionWithSubtitle(context, "Q 69: বয়স ", "(বিদেশে যাওয়ার সময় - পূর্ণ বছরে)"),
                    TextWidget.questionForm(context, moduleController.m9AgeController.value, 1),
                    TextWidget.singleQuestion(context, "Q 70: সর্বোচ্চ শ্রেণী পাস "),
                    TextWidget.questionForm(context, moduleController.m9ClassController.value, 1),
                    TextWidget.questionWithSubtitle(context, "Q 71: বিদেশে থাকার সময়কাল ", "(পূর্ণ বছরে)"),
                    TextWidget.questionForm(context, moduleController.m9YearController.value, 1),
                    TextWidget.singleQuestion(context, "Q 72: বিদেশে যাওয়ার কারন"),
                    module9DropDrown1(context),
                    TextWidget.questionWithSubtitle(context, "Q 73: সর্বশেষ গন্তব্য ", "(দেশের কোড লিখুন)"),
                    TextWidget.questionForm(context, moduleController.m9DestinationController.value, 1),
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

  Widget selectGender(){
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: [

          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(1.0)),
              border: Border.all(color: Colors.black, width: 1),
            ),
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [

                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Icon(Icons.remove, size: 15, color: Colors.grey),
                  ),
                  onTap: (){
                    if(moduleController.m9GenderBoyCounter.value <= 0 ) {
                      moduleController.m9GenderBoyCounter.value;
                    } else {
                      moduleController.m9GenderBoyCounter.value--;
                    }
                  },
                ),
                Obx(() => Text(
                  moduleController.m9GenderBoyCounter.value.toString(),
                  style: StyleManagement.testStyleBlack12,
                )),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Icon(Icons.add, size: 15, color: Colors.grey),
                  ),
                  onTap: (){
                    moduleController.m9GenderBoyCounter.value++;
                  },
                ),

              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(1.0)),
              border: Border.all(color: Colors.black, width: 1),
            ),
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [

                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Icon(Icons.remove, size: 15, color: Colors.grey),
                  ),
                  onTap: (){
                    if(moduleController.m9GenderGirlsCounter.value <= 0 ) {
                      moduleController.m9GenderGirlsCounter.value;
                    } else {
                      moduleController.m9GenderGirlsCounter.value--;
                    }
                  },
                ),
                Obx(() => Text(
                  moduleController.m9GenderGirlsCounter.value.toString(),
                  style: StyleManagement.testStyleBlack12,
                )),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Icon(Icons.add, size: 15, color: Colors.grey),
                  ),
                  onTap: (){
                    moduleController.m9GenderGirlsCounter.value++;
                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget genderText(){
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: [

          Container(
            width: 80,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            child: const Text(
              "ছেলে",
              style: StyleManagement.testStyleBlack12,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 80,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            child: const Text(
              "মেয়ে",
              style: StyleManagement.testStyleBlack12,
            ),
          ),

        ],
      ),
    );
  }

  Widget module9DropDrown1(BuildContext context){
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
              moduleController.selectM9DropDrown1.value.toString(),
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
                moduleController.setSelectM9DropDrown1(newValue!);
              },
              items: DataStore.m9DropDrownList1.map<DropdownMenuItem<String>>((item) {
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
