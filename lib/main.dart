
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:qus_survey/widget/screen_1.dart';
import 'package:qus_survey/widget/screen_10.dart';
import 'package:qus_survey/widget/screen_2.dart';
import 'package:qus_survey/widget/screen_3.dart';
import 'package:qus_survey/widget/screen_4.dart';
import 'package:qus_survey/widget/screen_5.dart';
import 'package:qus_survey/widget/screen_6.dart';
import 'package:qus_survey/widget/screen_7.dart';
import 'package:qus_survey/widget/screen_8.dart';
import 'package:qus_survey/widget/screen_9.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:get/get.dart';
import 'common/style_management.dart';
import 'common/utils.dart';
import 'controller/page_controller.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Questionnaire Survey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Questionnaire Survey'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final moduleController= Get.put(ModuleController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Information Form', style: StyleManagement.testStyleWhite18),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            SizedBox(
              height: 70,
              child: ScrollablePositionedList.builder(
                shrinkWrap: true,
                itemScrollController: moduleController.itemScrollController,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _indicator(index+1),
                          Obx(() => _progressBar(index+1)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          index == 0 ? _indicatorNote("পরিচিতি ও খানার সার সংক্ষেপ") :
                          index == 1 ? _indicatorNote("গৃহ সংক্রান্ত") :
                          index == 2 ? _indicatorNote("খানা সংক্রান্ত") :
                          index == 3 ? _indicatorNote("ব্যক্তি সংক্রান্ত") :
                          index == 4 ? _indicatorNote("অর্থনৈতিক কর্মকান্ড") :
                          index == 5 ? _indicatorNote("বিবাহ সংক্রান্ত") :
                          index == 6 ? _indicatorNote("জন্ম সংক্রান্ত") :
                          index == 7 ? _indicatorNote("বিদেশ ফেরত সদস্যদের জন্য") :
                          index == 8 ? _indicatorNote("আন্তর্জাতিক মাইগ্রেশন") :
                          _indicatorNote("মৃত্যু সংক্রান্ত")
                        ],
                      ),
                    ],
                  );
                }
              ),
            ),

            Obx(() => Expanded(child: Utils.changeScreen())),

          ],
        ),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _indicatorNote(String note){
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 35,
      width: 130,
      child: Text(
        note,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(.6), fontWeight: FontWeight.w300),
        maxLines: 2,
      ),
    );
  }

  Widget _indicator(int indicator){
    return InkWell(
      child: Obx(() => Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: moduleController.activeStep.value == indicator ? Colors.green : Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(.5)),
        ),
        child: Center(
          child: Text(
            "$indicator",
            style: TextStyle(
              fontSize: 14,
              color: moduleController.activeStep.value == indicator ? Colors.white : Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      )),
      onTap: (){
        moduleController.activeStep.value= indicator;
      },
    );
  }

  Widget _progressBar(int index){
    return Padding(
      padding: const EdgeInsets.all(0),
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        widgetIndicator: Container(
          height: 20,
          margin: const EdgeInsets.only(left: 20, top: 5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Colors.green,
            border: Border.all(color: Colors.grey.withOpacity(.5)),
          ),
          child: Center(
            child: Text(
              index == 8 ? "${moduleController.m8Progressing.value}%" :
              index == 9 ? "${moduleController.m9Progressing.value}%" :
              index == 10 ? "${moduleController.m10Progressing.value}%" : "0.0",
              style: StyleManagement.testStyleWhite8,
            ),
          ),
        ),
        width: 100,
        animation: true,
        lineHeight: 3,
        animationDuration: 500,
        percent: index == 8 ? moduleController.m8Percentage.value : index == 9 ?
        moduleController.m9Percentage.value : index == 10 ? moduleController.m10Percentage.value : moduleController.allPercent.value,
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: Colors.green.withOpacity(.5),
      ),
    );
  }

  Widget _bottomNavigation(){
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SizedBox(
            height: 30,
            width: 170,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: Colors.green),
                )),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: (){
                //Future.delayed(Duration(seconds: 1));
                Utils.customToast("সংরক্ষণ করা হয়েছে");
              },
              child: const Text(
                "খসড়া হিসেবে সংরক্ষণ করুন",
                style: StyleManagement.testStyleWhite12,
              ),
            ),
          ),

          SizedBox(
            height: 30,
            width: 130,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: const BorderSide(color: Colors.green),
                )),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: (){
                if(moduleController.m8Flag.isFalse){
                  Utils.customToast("মডিউল ৮ সম্পূর্ণ করুন");
                } else if(moduleController.m9Flag.isFalse){
                  Utils.customToast("মডিউল ৯ সম্পূর্ণ করুন");
                } else if(moduleController.m10Flag.isFalse){
                  Utils.customToast("মডিউল ১০ সম্পূর্ণ করুন");
                } else {
                  Utils.customToast("জমা হয়েছে");
                }
              },
              child: const Text(
                "জমা দিন",
                style: StyleManagement.testStyleGreen12,
              ),
            ),
          ),

        ],
      ),
    );
  }

}

