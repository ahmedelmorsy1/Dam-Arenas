import 'package:flutter/material.dart';
import 'custom_text.dart';

Widget showTime({bool? modelTime, int? time, String? period}) {
  return Column(
    children: [
      (modelTime == true && DateTime.now().hour < time!)
          ? CustomText(text: (period))
          : Container(),
      SizedBox(height: 20,)
    ],
  );
}
