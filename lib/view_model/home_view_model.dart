import 'package:dam_arenas/model/arena_model.dart';
import 'package:dam_arenas/services/home_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
 ValueNotifier<bool> get loading => _loading;
  
  ValueNotifier <bool> _loading = ValueNotifier(false);

  List<ArenaModel> get arenaModel => _arenaModel;
  List<ArenaModel> _arenaModel =[];

  HomeViewModel(){
    getBestArenas();
  }

  getBestArenas ()async{
    _loading.value = true;  
    await HomeService().getBestArenas().then((value) {
        for(int i = 0; i<value.length;i++){
          _arenaModel.add(ArenaModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
          _loading.value = false; 
        }
        print(_arenaModel.length);
        update();

    });}   
}