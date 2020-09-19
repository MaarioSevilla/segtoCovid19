import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:segtocovid19/ui/NavigationComponents/home/temperature_bar.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text('Home'),
          SearchBar(),
          IconButton(
            icon: SvgPicture.asset("images/icons/homeicon.svg"),
            onPressed: () {},
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(AntDesign.stepforward),
              Icon(Ionicons.ios_search),
              Icon(Ionicons.ios_heart),
              Icon(Ionicons.ios_heart_empty),
              Icon(Ionicons.ios_heart_half),
              Icon(Ionicons.ios_heart_dislike),
              Icon(Ionicons.ios_person),
              Icon(Ionicons.ios_stats),
              Icon(FontAwesome.glass),
              Icon(MaterialIcons.ac_unit),
              Icon(FontAwesome5.address_book),
              Icon(FontAwesome5Solid.address_book),
              Icon(FontAwesome5Brands.$500px)
            ],
          ),
        ],
      ),
    );
  }
}