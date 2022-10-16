
import 'package:dam_arenas/Screens/login_page.dart';
import 'package:dam_arenas/components/custom_button.dart';
import 'package:dam_arenas/components/custom_text.dart';
import 'package:dam_arenas/components/custom_text_form_field.dart';
import 'package:dam_arenas/view_model/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetWidget<Auth> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       resizeToAvoidBottomInset:false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white10,
        leading: GestureDetector(onTap: (){
          Get.off(()=> LoginPage());
        },
          child: Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: SingleChildScrollView(
        //reverse: true,
        child: Padding(padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
          //step 1 for signin with email
          child: Form(key: _formKey,
            child: Column(
              children: [
               CustomText(text: "Sign up",fontSize: 30,),
               SizedBox(height: 20,),

              CustomTextFormField(text: 'Name',
                hint: 'ahmed Elmorsy',
                onSave: (value) {controller.name = value!.toString();},
                validator: (value) {
                  if(value ==null){print("error");}
                },),
              SizedBox(height: 20,),

              CustomTextFormField(text: 'Email',
                hint: 'ahmedElmorsy@gmail.com',
                onSave: (value) {controller.email = value!;},
                validator: (value) {
                  if(value ==null){print("error");}
                },),
              SizedBox(height: 20,),

              CustomTextFormField(
                text: 'password',
                hint: '*********',
                onSave: (value) {controller.password = value!;},
                validator: (value) {
                    if(value ==null){print("error");}
                },),

              SizedBox(height: 20,),
              CustomButton(text: "Sign Up",
                onPressed: () {
                  _formKey.currentState!.save();
                  if(_formKey.currentState!.validate()){
                    controller.createAccountWithEmail();
                  }},),
            ],
          ),
        ),
    ),
      ),
  );
  }
}