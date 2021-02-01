import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/data/network/profile.dart';
import 'package:demo/providers/profiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Profile'),
        // ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(context) {
    final _data = Provider.of<Profiles>(context, listen: false).profile;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(200.0),
            child: CachedNetworkImage(
              width: 100,
              height: 100,
              placeholder: (context, url) => CircularProgressIndicator(),
              imageUrl: _data.imageUrl,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(_data.name),
          ),
          Container(
            child: Text(
              _data.email,
              style: TextStyle(color: Colors.black54),
            ),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text('Click to get API'),
            color: Colors.orangeAccent,
            onPressed: () {
              setState(() {
                getProfile(context);
              });
            },
          ),
          _cardInfo(context, Icon(Icons.supervised_user_circle), _data.name),
          _cardInfo(context, Icon(Icons.person), _data.gender),
          _cardInfo(context, Icon(Icons.date_range), _data.age.toString()),
          _cardInfo(context, Icon(Icons.app_registration), _data.registered),
          _cardInfo(context, Icon(Icons.phone), _data.phone),
          _cardInfo(context, Icon(Icons.settings_cell_sharp), _data.cell),
          _cardInfo(context, Icon(Icons.location_on), _data.location),
        ],
      ),
    );
  }

  Widget _cardInfo(context, Icon icon, String type) {
    final _widthScreen = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(5),
      width: _widthScreen * 0.9,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: ListTile(
          leading: icon,
          title: Text(
            type,
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
