import 'package:dam_arenas/components/my_drawer.dart';
import 'package:dam_arenas/components/list_view.dart';
import 'package:dam_arenas/model/ad_state.dart';
import 'package:dam_arenas/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BannerAd banner;


  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    // adState.initialization?.then((status) {
      setState(() {
              banner = BannerAd(
                adUnitId: adState.bannerAdUnitId,
                size: AdSize.banner,
                request: AdRequest(),
                listener: adState.listener
              )..load();
              
            });
           
    // });
    // print('hello world');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
            appBar: AppBar(title: Text('ملاعب دمنهور'),),
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                padding: EdgeInsets.only(top: 50,),
                // reverse: true,
                child: Column(
                  children: [
                    listViewArena(),
                    Container(
                      height: 50,
                      child:AdWidget(ad:banner), //??????????
                    )
                  ],
                ),
              ),
              drawer: MyDrawer(),
            ),
    );
  }
}
