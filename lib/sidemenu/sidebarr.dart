import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'sideMenu.dart';
import 'InfoCard.dart';
import 'Settingpage.dart';
import '../songpage/anysong.dart';
import '../theme/theme.dart';
import '../songpage/songbar.dart';

class sidebarr extends StatefulWidget {
  final bool theme;
  final VoidCallback returnPlay;

  sidebarr({Key? key, required this.theme, required this.returnPlay})
      : super(key: key);

  @override
  State<sidebarr> createState() => _sidebarrState();
}

class _sidebarrState extends State<sidebarr> {
  MellowTheme C = new MellowTheme();
  String username = "batman";

  void updateUsername(String newUsername) {
    setState(() {
      username = newUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
 // Define your 'songs' list here with actual song data

    return Container(
      width: 288,
      decoration: BoxDecoration(
        color: widget.theme ? C.blackM : Color.fromARGB(240, 255, 255, 255),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: widget.theme ? C.Nmellow3 : C.Dmellow2,
              child: Icon(
                CupertinoIcons.person,
                color: widget.theme ? C.blackM : Colors.white,
                size: 40,
              ),
            ),
            title: Text(
              username,
              style: const TextStyle(fontSize: 25),
            ),
            trailing: GestureDetector(
              onTap: () async {
                final updatedUsername = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoCard(
                      username1: '$username',
                    ),
                  ),
                );
                if (updatedUsername != null) {
                  updateUsername(updatedUsername);
                }
              },
              child: const Icon(
                Icons.drive_file_rename_outline_outlined,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ListView.builder(itemBuilder: (context,index){})
            ],
          ),
        ],
      ),
    );
  }
}
