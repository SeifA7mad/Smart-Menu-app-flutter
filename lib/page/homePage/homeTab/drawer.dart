import 'package:flutter/material.dart';

Widget buildDrawer() {
  return Drawer(
    child: Container(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            onDetailsPressed: () {},
            accountName: Text('Seif Ahmad'),
            accountEmail: Text('SeifAhamd@gmail.com'),
            currentAccountPicture: Icon(Icons.person_rounded, size: 50,),
          ),
          Card(
            shadowColor: Colors.black,
            color: Colors.blueGrey,
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              title: Text(
                'Account',
                style: TextStyle(color: Colors.limeAccent),
              ),
              leading:
              Icon(Icons.person_rounded, color: Colors.limeAccent),
              onTap: () {

              },
            ),
          ),
          Card(
            shadowColor: Colors.black,
            color: Colors.blueGrey,
            child: ListTile(
              contentPadding: EdgeInsets.all(20),
              title: Text(
                'logout',
                style: TextStyle(color: Colors.limeAccent),
              ),
              leading:
              Icon(Icons.door_sliding, color: Colors.limeAccent),
            ),
          )
        ],
      ),
    ),
  );
}