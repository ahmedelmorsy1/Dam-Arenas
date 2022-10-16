import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text ,  hint;
  final void Function(String?)? onSave ;
  final String? Function(String?)? validator;

  const CustomTextFormField({Key? key, this.text, this.hint, this.onSave, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
                children: [
                  CustomText(text: text,fontSize: 14,color: Colors.grey.shade900,),
                  TextFormField(
                    onSaved: onSave,
                    validator: validator,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                    ),
                  )
                ],
              ),
    );
  }
}