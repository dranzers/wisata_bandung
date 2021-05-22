import 'package:flutter/material.dart';
import 'package:wisata_bandung/favorite_button.dart';
import 'package:wisata_bandung/model/tourism_place.dart';

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  const DetailMobilePage({ this.place});

  @override
  Widget build(BuildContext context) {
    var informationTextStyle = TextStyle(fontFamily: 'Oxygen');
    return Scaffold(
        body:  SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(place.imageAsset),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: () {
                              Navigator.pop(context);
                            }),
                          ), FavoriteButton()]
                      ),
                    ),
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Text(place.name, textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Staatliches'
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(Icons.calendar_today),
                          Text(place.openDays, style: informationTextStyle),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.access_time),
                          Text(place.openTime, style: informationTextStyle),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(Icons.monetization_on_outlined),
                          Text(place.ticketPrice, style: informationTextStyle),
                        ],
                      ),
                    ]
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  place.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        )
    );
  }
}