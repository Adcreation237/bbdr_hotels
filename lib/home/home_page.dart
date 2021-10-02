import 'dart:math';

import 'package:bbdr_hotel/home/utils/hotel_package.dart';
import 'package:bbdr_hotel/home/utils/popular_hotels.dart';
import 'package:bbdr_hotel/home/utils/search_bar.dart';
import 'package:bbdr_hotel/hotel_details_screen.dart';
import 'package:bbdr_hotel/models/hotel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //final Hotel hotel;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          //window for search
          SearchBar(),
          //popular hotel
          SizedBox(
            height: 20.0,
          ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Popular Hotel',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
          PopularHotels(),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hotel Packages',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  'view all',
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          //HotelPackage()
        ],
      ),
    );
  }
}
