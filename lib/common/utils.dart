import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:qus_survey/common/style_management.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../controller/page_controller.dart';
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

class Utils{

  static final moduleController= Get.put(ModuleController());
  static final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  static final ItemScrollController itemScrollController = ItemScrollController();

  static customToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static changeScreen(){
    switch(moduleController.activeStep.value){
      case 1:
        return ScreenOne();
      case 2:
        return const ScreenTwo();
      case 3:
        return const ScreenThree();
      case 4:
        return const ScreenFour();
      case 5:
        return const ScreenFive();
      case 6:
        return const ScreenSix();
      case 7:
        return const ScreenSeven();
      case 8:
        return ScreenEight();
      case 9:
        return ScreenNine();
      case 10:
        return ScreenTen();
      default:
        return const Text("out of page bound");
    }
  }
  static nextButton() {
    return InkWell(
      child: Container(
        height: 25,
        width: 100,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
         decoration: const BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(8)),
           color: Colors.green,
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Text(
               "পরবর্তি প্রশ্ন",
               style: StyleManagement.testStyleWhite12,
             ),
             const SizedBox(width: 7),
             Image.asset(
               "assets/images/righticon.png",
               height: 8,
               width: 15,
               fit: BoxFit.fitWidth,
               color: Colors.white,
             ),
           ],
         ),
       ),
       onTap: (){
         gotoNextIndicator();
       },
     );
   }
  static Future gotoNextIndicator() async {
     if (moduleController.activeStep.value < 10) {
       moduleController.activeStep.value++;
       changeScreen();
       moduleController.controllerAttach(moduleController.activeStep.value);
     } else {
       Utils.customToast("Finished");
       moduleController.m10PageProgressing(
         moduleController.m10RadioBtn1.value,
         moduleController.m10DeathNameController.value.text.toString(),
         moduleController.m10GenderMenCounter.value,
         moduleController.m10GenderWomenCounter.value,
         moduleController.m10DeathAgeController.value.text.toString(),
         moduleController.selectM10DropDrown1.value,
         moduleController.m10RadioBtn2.value,
         moduleController.m10RadioBtn3.value,
         moduleController.m10RadioBtn4.value,
         moduleController.m10RadioBtn5.value,
       );
     }
   }
  static previousButton() {
     return InkWell(
       child: Image.asset(
         "assets/images/lefticon.png",
         height: 12,
         width: 25,
         fit: BoxFit.fitWidth,
         color: Colors.green,
       ),
       onTap: (){
         gotoPreviousIndicator();
       },
     );
   }
  static Future gotoPreviousIndicator() async {
     if (moduleController.activeStep.value > 1) {
       moduleController.activeStep.value--;
       changeScreen();
       moduleController.controllerAttach(moduleController.activeStep.value);
     } else {
       Utils.customToast("invalid");
     }
   }

}