import 'package:flutter/material.dart';
import 'package:wisata_bandung/detail_screen.dart';
import 'package:wisata_bandung/model/tourism_place.dart';
import 'package:wisata_bandung/tourism_place_grid.dart';
import 'package:wisata_bandung/tourism_place_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Wisata Bandung')),
        body: LayoutBuilder(
            builder: (context, constraints) {
              if(constraints.maxWidth <= 600){
                return TourismPlaceList();
              }
              else if(constraints.maxWidth <= 1200){
                return TourismPlaceGrid(gridCount: 4);
              }
              else {
                return TourismPlaceGrid(gridCount: 6);
              }
            },
        )
    );
  }
}

