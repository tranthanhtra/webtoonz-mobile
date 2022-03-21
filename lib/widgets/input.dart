import 'package:flutter/material.dart';
import 'package:webtoonz_mobile/utils/config.dart';

Container inputRegular(
  BuildContext context, {
  String? label,
  required String hintText,
  required TextEditingController textEditingController,
  bool required = false,
  double height = 48,
  double width = 0,
  int maxLines = 1,
  int minLines = 1,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Container(
    width: width == 0 ? null : getWidth(width),
    child: Column(
      children: [
        label != null
            ? Container(
                margin: EdgeInsets.only(
                  // left: getWidth(16),
                  right: getWidth(16),
                ),
                width: double.infinity,
                child: Row(children: [
                  Text(label,
                      style: TextStyle(
                          fontSize: getHeight(14),
                          fontWeight: FontWeight.w500)),
                ]),
              )
            : Container(),
        label != null
            ? SizedBox(
                height: getHeight(6),
              )
            : Container(),
        Container(
          height: getHeight(height),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getHeight(6)),
            border: Border.all(
              color: const Color(0xFFE6E6E6),
              width: getHeight(1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  maxLines: maxLines,
                  minLines: minLines,
                  keyboardType: keyboardType,
                  controller: textEditingController,
                  style: TextStyle(
                    fontSize: getHeight(14),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    labelText: hintText,
                    contentPadding: EdgeInsets.only(
                      left: getWidth(18),
                      bottom: getHeight(20),
                    ),
                    labelStyle: TextStyle(
                        color: const Color(0xFF9E9E9E),
                        fontSize: getHeight(14)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container inputPassword(
  BuildContext context, {
  String? label,
  bool required = false,
  required TextEditingController controller,
  required String hintText,
  required bool isHide,
  required Function changeHide,
}) {
  return Container(
    child: Column(
      children: [
        label != null
            ? Container(
                margin: EdgeInsets.only(
                  // left: getWidth(16),
                  right: getWidth(16),
                ),
                width: double.infinity,
                child: Row(children: [
                  Text(label,
                      style: TextStyle(
                          fontSize: getHeight(14),
                          fontWeight: FontWeight.w500)),
                  required
                      ? Text("*")
                      : Container()
                ]),
              )
            : Container(),
        label != null
            ? SizedBox(
                height: getHeight(6),
              )
            : Container(),
        Container(
          height: getHeight(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(getHeight(6)),
            border: Border.all(
              color: const Color(0xFFE6E6E6),
              width: getHeight(1),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                    style: TextStyle(fontSize: getHeight(14)),
                    controller: controller,
                    obscureText: isHide,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: hintText,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: EdgeInsets.only(
                          left: getWidth(18), bottom: getHeight(20)),
                      labelStyle: TextStyle(
                          fontSize: getHeight(14)),
                    )),
              ),
              IconButton(
                  onPressed: () {
                    changeHide();
                  },
                  icon: Icon(
                    isHide ? Icons.visibility_off : Icons.visibility,
                    size: 16,
                  ))
            ],
          ),
        )
      ],
    ),
  );
}
