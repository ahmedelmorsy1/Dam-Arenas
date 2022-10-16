 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';

openMapsSheet(context) async {
    try {
      final coords = Coords(30.474038, 31.200053);
      final title = "";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(coords: coords,title: title,),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(map.icon,height: 30.0,width: 30.0,),
                        ),
                  ],),),
            ),);},
            );
    } catch (e) 
    {print(e);}
    }