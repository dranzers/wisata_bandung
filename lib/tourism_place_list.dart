import 'package:flutter/material.dart';
import 'package:wisata_bandung/detail_screen.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

class TourismPlaceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      final TourismPlace place = tourismPlaceList[index];
      return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DetailScreen(place: place);
          }));
        },
        child: Card(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Image.asset(place.imageAsset)),
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(place.name, style: TextStyle(fontSize: 16.0)),
                            SizedBox(height: 10),
                            Text(place.location)
                          ]
                      )
                  )
              )
            ],
          ),
        ),
      );
    }, itemCount: tourismPlaceList.length);
  }
}