import 'package:dam_arenas/view_model/auth.dart';
import 'package:dam_arenas/view_model/control_view_model.dart';
import 'package:dam_arenas/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    Get.lazyPut(() => Auth());
    Get.lazyPut(() => ControlViewModel());
  }

}