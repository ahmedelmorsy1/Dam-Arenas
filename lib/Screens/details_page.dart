import 'package:dam_arenas/components/custom_text.dart';
import 'package:dam_arenas/components/maps_sheet.dart';
import 'package:dam_arenas/components/show_time.dart';
import 'package:dam_arenas/model/arena_model.dart';
import 'package:flutter/material.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart'; 

class DetailsPage extends StatelessWidget {
   
  final ArenaModel model;
  DetailsPage({required this.model});
  double counter = 0.0;
  double totalCounter = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تفاصيل الملعب'),),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              CustomText(text:("اسم الملعب:   " + model.name.toString()),),
              CustomText(text:("السعر:  " + model.price.toString()),),

              (model.wired ==true)?CustomText(text:("شبكة:   موجود" ),)
              :CustomText(text:("شبكة:   مفيش" ),),

              CustomText(text:'المواعيد المتاحة',),

              showTime(modelTime: model.fivePm,time: 17,period:"5:00 - 6:00 pm",), 
              showTime(modelTime: model.sixPm,time: 18,period:"6:00 - 7:00 pm",), 
              showTime(modelTime: model.sevenPm,time: 19,period:"7:00 - 8:00 pm",), 
              Center(child: TextButton(onPressed: () => openMapsSheet(context),
              child: CustomText(text:'افتح الخريطة',fontSize: 25,))),
              SizedBox(height: 20,),
              // SmoothStarRating(
              //   rating: 5.0,isReadOnly: false,
              //   size: 70,filledIconData: Icons.star,
              //   halfFilledIconData: Icons.star_half,defaultIconData: Icons.star_border,
              //   starCount: 5,allowHalfRating: true,spacing: 2.0,
              //   onRated: (value) {counter += value; totalCounter += 5;},),
              Text('Rating :'+ counter.toString() + '/' + totalCounter.toString())
            ],
          ),),),);
  }}
