import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'sideMenu.dart';
import 'InfoCard.dart';
import 'Settingpage.dart';
import '../songpage/anysong.dart';
import '../theme/theme.dart';

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

  Widget build(BuildContext context) {
    return Container(
        width: 288,
        decoration: BoxDecoration(
          color: widget.theme
              ? C.blackM
              : Color.fromARGB(240, 255, 255, 255),
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
                  color: widget.theme? C.blackM:Colors.white,
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
                Divider(
                  color: widget.theme ? Colors.green : C.Dmellow2,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                  height: 1,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Anysong(type: "s")));
                      widget.returnPlay();
                    },
                    child: sideMenu(
                        iconData: widget.theme
                            ? Icons.local_fire_department
                            : Icons.auto_awesome,
                        title: "name1")),
                Divider(
                  color: widget.theme ? Colors.green : Colors.red.shade600,
                  thickness: 3,
                  height: 1,
                ),
                GestureDetector(
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Anysong(type: "s"))),
                          widget.returnPlay()
                        },
                    child: sideMenu(
                        iconData: widget.theme
                            ? Icons.water_drop
                            : Icons.electric_bolt,
                        title: "name2")),
                Divider(
                  color: widget.theme ? Colors.green : Colors.red.shade600,
                  thickness: 3,
                  height: 1,
                ),
                GestureDetector(
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Anysong(type: "s"))),
                          widget.returnPlay()
                        },
                    child: sideMenu(
                        iconData: widget.theme ? Icons.air : Icons.soup_kitchen,
                        title: "name3")),
                Divider(
                  color: widget.theme ? Colors.green : Colors.red.shade600,
                  thickness: 3,
                  height: 1,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Anysong(type: "s")));
                      widget.returnPlay();
                    },
                    child: sideMenu(
                        iconData: widget.theme
                            ? Icons.cruelty_free
                            : Icons.attach_money,
                        title: "name4")),
                Divider(
                  color: widget.theme ? Colors.green : Colors.red.shade600,
                  thickness: 3,
                  height: 1,
                ),
                GestureDetector(
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Anysong(type: "s"))),
                          widget.returnPlay()
                        },
                    child: sideMenu(
                        iconData:
                            widget.theme ? Icons.storm : Icons.mic_external_on,
                        title: "name5")),
                Divider(
                  color: widget.theme ? Colors.green : Colors.red.shade600,
                  thickness: 3,
                  height: 1,
                ),
                GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(herodialog(
                      //     builder: (context) {
                      //       return helppp(theme: widget.theme,);
                      //     },
                      //     cc: Colors.black54));
                    },
                    child: sideMenu(iconData: Icons.help, title: "Help")),
                Divider(
                  color: widget.theme ? Colors.green : Colors.red.shade600,
                  thickness: 3,
                  height: 1,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => templateSideBar(
                                  theme: widget.theme,
                                )),
                      );
                    },
                    child:
                        sideMenu(iconData: Icons.settings, title: "Setting")),
                        SizedBox(height: 5,)
              ],
            ),
          ],
        ));
  }
}
