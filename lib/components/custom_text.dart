import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  const CustomText(
      {Key? key,
      this.text ="",
      this.fontSize = 18,
      this.color =Colors.black,
      this.alignment =Alignment.topRight,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(text!,style: TextStyle(color: color,fontSize: fontSize,),),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
