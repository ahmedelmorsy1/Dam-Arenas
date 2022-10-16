import 'package:dam_arenas/Screens/login_page.dart';
import 'package:dam_arenas/Screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'listTile.dart';


class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            // color: Theme.of(context).accentColor,
            color: Theme.of(context).colorScheme.secondary,
            height: 120, width: double.infinity,
            padding: EdgeInsets.all(20), alignment: Alignment.center,
            child: Text('مرحبا بك',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 20,),
          buildListTile('login',Icons.login,(){Get.to(()=>LoginPage());}),
          buildListTile('signUp',Icons.app_registration,(){Get.to(()=>SignUpPage());}),
          // buildListTile('signUp',Icons.app_registration,
          // (){Get.to(()=>AdminService('y89sAGs9e17PK64mtIAY'));}),

        ],
      ),
    );
  }
}
