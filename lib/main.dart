import 'package:dam_arenas/Screens/home_page.dart';
import 'package:dam_arenas/model/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'helper/binding.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
void main() async{
  Binding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  await Firebase.initializeApp();
  runApp(Provider.value(
    value: adState,
    builder: (context ,child) => MyApp(),
    ));
}
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
  
}
