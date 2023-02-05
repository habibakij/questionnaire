
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qus_survey/widget/text_widget.dart';
import '../common/style_management.dart';
import '../common/utils.dart';
import 'package:get/get.dart';
import '../controller/page_controller.dart';
import '../domain/database/data_store.dart';


class ScreenTen extends StatelessWidget {

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
                    TextWidget.titleText("মডিউল ১০ঃ মৃত্যু সনংক্রান্ত (গত ১২ মাসে)", 0),
                    TextWidget.titleText("(সকল বয়সের সদস্যদের জন্যে)", 1),
                    /// question
                    TextWidget.singleQuestion(context, "Q 74: গত ১২ মাসে এখানে কোন সদস্য মৃত্যু বরন করেছেন কি ?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn1.value,
                                groupValue: 1,
                                onChanged: (value){
                                  moduleController.m10RadioBtn1.value= 1;
                                },
                              )),
                              const Expanded(child: Text("হ্যা"))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn1.value,
                                groupValue: 2,
                                onChanged: (value){
                                  moduleController.m10RadioBtn1.value= 2;
                                },
                              )),
                              const Expanded(child: Text("না"))
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),

                      ],
                    ),
                    TextWidget.singleQuestion(context, "Q 75: মৃতের নাম"),
                    TextWidget.questionForm(context, moduleController.m10DeathNameController.value, 0),
                    TextWidget.singleQuestion(context, "Q 76: লিঙ্গ"),
                    selectGender(),
                    genderText(),
                    TextWidget.questionWithSubtitle(context, "Q 77: মৃত্যুকালে বয়স কত ছিলো ?", "(পূর্ণ বছরে)"),
                    TextWidget.questionForm(context, moduleController.m10DeathAgeController.value, 1),
                    TextWidget.singleQuestion(context, "Q 78: কোথায় মারা গেছেন"),
                    module10DropDrown1(context),
                    TextWidget.singleQuestion(context, "Q 79: নাম - মৃত্যুর সময় গর্ভবতী ছিলেন কি ?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn2.value,
                                groupValue: 1,
                                onChanged: (value){
                                  moduleController.m10RadioBtn2.value= 1;
                                },
                              )),
                              const Expanded(child: Text("হ্যা"))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn2.value,
                                groupValue: 2,
                                onChanged: (value){
                                  moduleController.m10RadioBtn2.value= 2;
                                },
                              )),
                              const Expanded(child: Text("না"))
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),

                      ],
                    ),
                    TextWidget.singleQuestion(context, "Q 80: নাম -  গর্ভপাতের সময় অথবা গর্ভপাতের ৪২ দিনের মধ্যে মারা গেছেন কি ?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn3.value,
                                groupValue: 1,
                                onChanged: (value){
                                  moduleController.m10RadioBtn3.value= 1;
                                },
                              )),
                              const Expanded(child: Text("হ্যা"))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn3.value,
                                groupValue: 2,
                                onChanged: (value){
                                  moduleController.m10RadioBtn3.value= 2;
                                },
                              )),
                              const Expanded(child: Text("না"))
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),

                      ],
                    ),
                    TextWidget.singleQuestion(context, "Q 81 a: নাম - নাম -  বাচ্চা প্রসবের সময় মারা গেছেন কি?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn4.value,
                                groupValue: 1,
                                onChanged: (value){
                                  moduleController.m10RadioBtn4.value= 1;
                                },
                              )),
                              const Expanded(child: Text("হ্যা"))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn4.value,
                                groupValue: 2,
                                onChanged: (value){
                                  moduleController.m10RadioBtn4.value= 2;
                                },
                              )),
                              const Expanded(child: Text("না"))
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),

                      ],
                    ),
                    TextWidget.singleQuestion(context, "Q 81 b: নাম - প্রসবের ৪২ দিনের মধ্যে মারা গেছেন কি ?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn5.value,
                                groupValue: 1,
                                onChanged: (value){
                                  moduleController.m10RadioBtn5.value= 1;
                                },
                              )),
                              const Expanded(child: Text("হ্যা"))
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Obx(() => Radio(
                                value: moduleController.m10RadioBtn5.value,
                                groupValue: 2,
                                onChanged: (value){
                                  moduleController.m10RadioBtn5.value= 2;
                                },
                              )),
                              const Expanded(child: Text("না"))
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),

                      ],
                    ),

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
                      child: Obx(() => LinearPercentIndicator(
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
                      )),
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
                    if(moduleController.m10GenderMenCounter.value <= 0 ) {
                      moduleController.m10GenderMenCounter.value;
                    } else {
                      moduleController.m10GenderMenCounter.value--;
                    }
                  },
                ),
                Obx(() => Text(
                  moduleController.m10GenderMenCounter.value.toString(),
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
                    moduleController.m10GenderMenCounter.value++;
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
                    if(moduleController.m10GenderWomenCounter.value <= 0 ) {
                      moduleController.m10GenderWomenCounter.value;
                    } else {
                      moduleController.m10GenderWomenCounter.value--;
                    }
                  },
                ),
                Obx(() => Text(
                  moduleController.m10GenderWomenCounter.value.toString(),
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
                    moduleController.m10GenderWomenCounter.value++;
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
              "পূরুয",
              style: StyleManagement.testStyleBlack12,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 80,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            child: const Text(
              "মহিলা",
              style: StyleManagement.testStyleBlack12,
            ),
          ),

        ],
      ),
    );
  }

  Widget module10DropDrown1(BuildContext context){
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
              moduleController.selectM10DropDrown1.value.toString(),
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
                moduleController.setSelectM10DropDrown1(newValue!);
              },
              items: DataStore.m10DropDrownList1.map<DropdownMenuItem<String>>((item) {
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
