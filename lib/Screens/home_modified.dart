import 'package:dam_arenas/components/list_view.dart';
import 'package:dam_arenas/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePageModified extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
            appBar: AppBar(title: Text('ملاعب دمنهور'),),
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                padding: EdgeInsets.only(top: 50,),
                // reverse: true,
                child: listViewArena(),
              ),
             
            ),
    );
  }
}
