import 'package:dam_arenas/components/custom_button.dart';
import 'package:dam_arenas/components/custom_text_form_field.dart';
import 'package:dam_arenas/view_model/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetWidget<Auth> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white10,
      ),
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
        child: Form(key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(text: 'Email',
                hint: 'ahmedElmorsy@gmail.com',
                onSave: (value) {controller.email = value.toString();},
                validator: (value) {
                  if(value ==null){print("error");}
                },),
              SizedBox(height: 10,),
              CustomTextFormField(
                text: 'password',
                hint: '*********',
                onSave: (value) {controller.password = value!;},
                validator: (value) {
                   if(value ==null){print("error");}
                },),
              SizedBox(height: 10,),
              CustomButton(text: "Sign IN",
                onPressed: () {
                  _formKey.currentState!.save();
                  if(_formKey.currentState!.validate()){
                    controller.signInWithEmail();
                  }else{
                    print('wrong');
                  }
                  },),
            ],
          ),
        ),
      ),
    );
  }
}
