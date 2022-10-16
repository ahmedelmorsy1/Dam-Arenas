import 'package:dam_arenas/Screens/details_page.dart';
import 'package:dam_arenas/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_text.dart';

Widget listViewArena() {
    return GetBuilder<HomeViewModel>(
      builder: (controller ) => Container(
        height: 350,
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 10,thickness: 1,),
            scrollDirection: Axis.vertical,
            itemCount: controller.arenaModel.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {Get.to(() => DetailsPage(model: controller.arenaModel[index]));},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: CustomText(text:(controller.arenaModel[index].name),
                ),
                ),
              );
            }),
      ),
    );
  }