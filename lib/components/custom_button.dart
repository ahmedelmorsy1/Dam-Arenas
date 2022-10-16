import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
final String? text;
final void Function()? onPressed;
final Color color;

  const CustomButton({  this.text, this.onPressed, this.color =Colors.black}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.all(5),
              decoration: ShapeDecoration(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: color,),
              child: TextButton(
                onPressed: onPressed,
                child: CustomText(text: text,alignment: Alignment.center,color: Colors.white,),
                
              ),
            );
  }
}