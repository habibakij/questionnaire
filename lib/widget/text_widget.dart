
import 'package:flutter/material.dart';
import '../common/style_management.dart';

class TextWidget extends StatelessWidget {

  static Widget titleText(String title, int color){
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: color == 1 ? StyleManagement.testStyleGreenBold12 : StyleManagement.testStyleBlackBold12,
      ),
    );
  }

  static Widget singleQuestion(BuildContext context, String text){
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: StyleManagement.testStyleBlackBold12,
            ),
          ),
        ],
      ),
    );
  }

  static Widget questionWithSubtitle(BuildContext context, String title, String subTitle){
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: Row(
        children: [
          Text(
            title,
            style: StyleManagement.testStyleBlackBold12,
          ),
          Text(
            subTitle,
            style: StyleManagement.testStyleGreyHints12,
          ),
        ],
      ),
    );
  }

  static Widget questionForm(BuildContext context, TextEditingController controller, int type){
    return Container(
      height: 30,
      width: 180,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: const Color(0xFFB2BAFF)),
      ),
      alignment: Alignment.centerLeft,
      child: TextFormField(
        controller: controller,
        keyboardType: type == 1 ? TextInputType.number : TextInputType.text,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          focusColor: Colors.white,
          hintText: "",
          hintStyle: StyleManagement.testStyleBlackHints12,
        ),
        style: StyleManagement.testStyleBlack12,
      ),
    );
  }

  static Widget questionFormWithTitle(BuildContext context, String fieldName, TextEditingController controller, int type){
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 65,
            child: Text(
              fieldName,
              style: StyleManagement.testStyleBlackBold12,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            //height: 48,
            width: 180,
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: const Color(0xFFB2BAFF)),
            ),
            alignment: Alignment.centerLeft,
            child: TextFormField(
              controller: controller,
              keyboardType: type == 1 ? TextInputType.number : TextInputType.text,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                focusColor: Colors.white,
                hintText: "",
                hintStyle: StyleManagement.testStyleBlackHints12,
              ),
              style: StyleManagement.testStyleBlack12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
