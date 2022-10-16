import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dam_arenas/components/custom_button.dart';
import 'package:dam_arenas/components/custom_text.dart';
import 'package:dam_arenas/view_model/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  class AdminPage extends GetWidget<Auth> {
  // class AdminPage extends GetxController {
  final data = Get.arguments;
  final CollectionReference users = FirebaseFirestore.instance.collection('Arenas');
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المواعيد المتاحة')),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(data).get(),
        builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData ) {
            return Text("Document does not exist");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data?.data() as Map<String, dynamic>;
            return SingleChildScrollView(
              child: Column(children: [  
                  SizedBox(height: 20,),
                  CustomText(text: "Full Name: ${data['name']}",fontSize: 25,),
                  SizedBox(height: 20,),
                  CustomText(text: "price: ${data['price']}",),
                   SizedBox(height: 20,),
                   (data['wired'] ==false)?CustomText(text:("شبكة:   موجود" ),)
                  :CustomText(text:("شبكة:   مفيش" ),),
                  SizedBox(height: 20,),
                  

                  (data['5:00 - 6:00 pm'] ==true)?CustomButton(text:("5:00 - 6:00 pm" ),
                  onPressed:() => updateUser('5:00 - 6:00 pm'),)
                  :CustomButton(text:("5:00 - 6:00 pm" ),
                  onPressed:() => updateTrueUser('5:00 - 6:00 pm'),),
                  SizedBox(height: 20,),
                  (data['6:00 - 7:00 pm'] ==true)?CustomButton(text:("6:00 - 7:00 pm" ),
                  onPressed:() => updateUser('6:00 - 7:00 pm'),)
                  :CustomButton(text:("6:00 - 7:00 pm" ),
                  onPressed:() => updateTrueUser('6:00 - 7:00 pm'),),
                  SizedBox(height: 20,),
                  (data['7:00 - 8:00 pm'] ==true)?CustomButton(text:("7:00 - 8:00 pm" ),
                  onPressed:() => updateUser('7:00 - 8:00 pm'),)
                  :CustomButton(text:("7:00 - 8:00 pm" ),
                  onPressed:() => updateTrueUser('7:00 - 8:00 pm'),),
                  SizedBox(height: 20,),
                  ],
              ),
            );
          }
          return Text("loading");
        },
      ),
    );
  }

   updateUser(String date) {
    users.doc(data).update({date: false})
    .then((value) =>  print('user updated'))
    .catchError((error) => print("Failed to update user: $error"));
    //update();
    }
 updateTrueUser(String date) {
    users.doc(data).update({date: true})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
     //update();
    }
  
  
}
