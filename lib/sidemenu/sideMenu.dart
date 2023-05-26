import 'package:flutter/material.dart';

class sideMenu extends StatelessWidget {
  final IconData iconData;
  final String title;

  sideMenu({required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 40,
        width: 34,
        child: Icon(iconData,size: 40,),
      ),
      title: Text(title,style: TextStyle(fontSize: 20),),
    );
  }
}
