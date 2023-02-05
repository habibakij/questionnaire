
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ModuleController extends GetxController {

  late final itemScrollController;
  late final itemPositionsListener;
  RxBool m8Flag= false.obs;
  RxBool m9Flag= false.obs;
  RxBool m10Flag= false.obs;

  @override
  void onInit() {
    super.onInit();
    itemScrollController = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create();
  }

  @override
  void dispose() {
    super.dispose();
    m8CountryCodeController.close();
    m8CountryCodeController.close();
    m8YearController.close();
    m9NameController.close();
    m9AgeController.close();
    m9ClassController.close();
    m9YearController.close();
    m9DestinationController.close();
    m10DeathNameController.close();
    m10DeathAgeController.close();
  }

  RxDouble allPercent= 0.0.obs;
  RxInt activeStep = 1.obs;
  RxDouble bottomGrossProgressing= 0.0.obs;
  RxDouble bottomGrossPercentage= 0.0.obs;
  Future controllerAttach(index) async {

    itemScrollController.jumpTo(
      index: index,
      alignment: 0.5,
    );

    /*if(itemScrollController.isAttached){
      itemScrollController.scrollTo(
        index: index,
        alignment: 0.5,
        duration: const Duration(seconds: 1),
        curve: Curves.linear,
      );
    }*/
    if(index == 9){
      log("check_index: $index");
      m8PageProgressing(
        m8CountryNameController.value.text.toString(),
        m8CountryCodeController.value.text.toString(),
        m8YearController.value.text.toString(),
        selectM8DropDrown2.value.toString(),
        selectM8DropDrown1.value.toString(),
      );
    } else if(index == 10){
      log("check_index: $index");
      m9PageProgressing(
        m9NameController.value.text.toString(),
        m9GenderBoyCounter.value,
        m9GenderGirlsCounter.value,
        m9AgeController.value.text.toString(),
        m9ClassController.value.text.toString(),
        m9YearController.value.text.toString(),
        selectM9DropDrown1.value,
        m9DestinationController.value.text.toString(),
      );
    }
  }
  /// module 8 data
  RxDouble m8Progressing= 0.0.obs;
  RxDouble m8Percentage= 0.0.obs;
  RxInt m8TotalCoverField= 0.obs;
  final m8CountryNameController= TextEditingController().obs;
  final m8CountryCodeController= TextEditingController().obs;
  final m8YearController= TextEditingController().obs;
  void m8PageProgressing(String countryName, String countryCode, String year, String month, String reason){
    int value1= 0, value2= 0, value3= 0, value4= 0, value5= 0;
    value1= countryName.isEmpty ? 0 : 1;
    value2= countryCode.isEmpty ? 0 : 1;
    value3= year.isEmpty ? 0 : 1;
    value4= month == "Please select" ? 0 : 1;
    value5= reason == "Please select" ? 0 : 1;
    m8TotalCoverField.value= value1+value2+value3+value4+value5;
    if(m8TotalCoverField.value == 5){
      m8Flag.value= true;
    } else {
      m8Flag.value= false;
    }
    /// top progress
    String pp= ((100 * m8TotalCoverField.value) / 5).toStringAsFixed(2);
    m8Progressing.value= double.parse(pp);
    String pro= (m8Progressing.value / 100).toStringAsFixed(2);
    m8Percentage.value= double.parse(pro);
    /// bottom progress
    String bb= ((33.33 * m8TotalCoverField.value) / 5).toStringAsFixed(2);
    bottomGrossProgressing.value= double.parse(bb);
    String gPro= (bottomGrossProgressing.value / 100).toStringAsFixed(2);
    bottomGrossPercentage.value= double.parse(gPro);
  }
  RxString selectM8DropDrown1= "Please select".obs;
  void setSelectM8DropDrown1(String value){
    selectM8DropDrown1.value= value;
  }
  RxString selectM8DropDrown2= "Please select".obs;
  void setSelectM8DropDrown2(String value){
    selectM8DropDrown2.value= value;
  }
  /// module 9
  RxDouble m9Progressing= 0.0.obs;
  RxDouble m9Percentage= 0.0.obs;
  RxInt m9TotalCoverField= 0.obs;
  final m9NameController= TextEditingController().obs;
  final m9AgeController= TextEditingController().obs;
  final m9ClassController= TextEditingController().obs;
  final m9YearController= TextEditingController().obs;
  final m9DestinationController= TextEditingController().obs;
  RxInt m9GenderBoyCounter= 0.obs;
  RxInt m9GenderGirlsCounter= 0.obs;
  void m9PageProgressing(String name, int genderBoy, int genderGirl, String age, String cls, String year, String reason, String destination){
    int value1= 0, value2= 0, value3= 0, value4= 0, value5= 0, value6= 0, value7= 0;
    value1= name.isEmpty ? 0 : 1;
    value2= genderBoy > 0 || genderGirl > 0 ? 1 : 0;
    value3= age.isEmpty ? 0 : 1;
    value4= cls.isEmpty ? 0 : 1;
    value5= year.isEmpty ? 0 : 1;
    value6= reason == "Please select" ? 0 : 1;
    value7= destination.isEmpty ? 0 : 1;
    m9TotalCoverField.value= value1+value2+value3+value4+value5+value6+value7;
    if(m9TotalCoverField.value == 7){
      m9Flag.value= true;
    } else {
      m9Flag.value= false;
    }
    /// top progress
    String pp= ((100 * m9TotalCoverField.value) / 7).toStringAsFixed(2);
    m9Progressing.value= double.parse(pp);
    String pro= (m9Progressing.value / 100).toStringAsFixed(2);
    m9Percentage.value= double.parse(pro);
    /// bottom progress
    int total= m8TotalCoverField.value + m9TotalCoverField.value;
    log("check_fill_9 :$total");
    String bb= ((66.66 * total) / 12).toStringAsFixed(2);
    bottomGrossProgressing.value= double.parse(bb);
    String gPro= (bottomGrossProgressing.value / 100).toStringAsFixed(2);
    bottomGrossPercentage.value= double.parse(gPro);
  }
  RxString selectM9DropDrown1= "Please select".obs;
  void setSelectM9DropDrown1(String value){
    selectM9DropDrown1.value= value;
  }
  /// module 10
  final m10DeathNameController= TextEditingController().obs;
  final m10DeathAgeController= TextEditingController().obs;
  RxInt m10GenderMenCounter= 0.obs;
  RxInt m10GenderWomenCounter= 0.obs;
  RxDouble m10Progressing= 0.0.obs;
  RxDouble m10Percentage= 0.0.obs;
  RxInt m10TotalCoverField= 0.obs;
  void m10PageProgressing(int radioBtn1, String deathName, int genderMan, int genderWomen, String deathAge, String deathPace,
      int radioBtn2, int radioBtn3, int radioBtn4, int radioBtn5){
    int value1= 0, value2= 0, value3= 0, value4= 0, value5= 0, value6= 0, value7= 0, value8= 0, value9= 0;
    value1= radioBtn1 == 0 ? 0 : 1;
    value2= deathName.isEmpty ? 0 : 1;
    value3= genderMan > 0 || genderWomen > 0 ? 1 : 0;
    value4= deathAge.isEmpty ? 0 : 1;
    value5= deathPace == "Please select" ? 0 : 1;
    value6= radioBtn2 == 0 ? 0 : 1;
    value7= radioBtn3 == 0 ? 0 : 1;
    value8= radioBtn4 == 0 ? 0 : 1;
    value9= radioBtn5 == 0 ? 0 : 1;
    m10TotalCoverField.value= value1+value2+value3+value4+value5+value6+value7+value8+value9;
    if(m10TotalCoverField.value == 9){
      m10Flag.value= true;
    } else {
      m10Flag.value= false;
    }
    /// top progress
    String pp= ((100 * m10TotalCoverField.value) / 9).toStringAsFixed(2);
    m10Progressing.value= double.parse(pp);
    String pro= (m10Progressing.value / 100).toStringAsFixed(2);
    m10Percentage.value= double.parse(pro);
    /// bottom progress
    int total= m8TotalCoverField.value + m9TotalCoverField.value + m10TotalCoverField.value;
    String bb= ((100 * total) / 21).toStringAsFixed(2);
    bottomGrossProgressing.value= double.parse(bb);
    String gPro= (bottomGrossProgressing.value / 100).toStringAsFixed(2);
    bottomGrossPercentage.value= double.parse(gPro);
  }
  RxString selectM10DropDrown1= "Please select".obs;
  void setSelectM10DropDrown1(String value){
    selectM10DropDrown1.value= value;
  }
  RxInt m10RadioBtn1= 0.obs;
  RxInt m10RadioBtn2= 0.obs;
  RxInt m10RadioBtn3= 0.obs;
  RxInt m10RadioBtn4= 0.obs;
  RxInt m10RadioBtn5= 0.obs;


}