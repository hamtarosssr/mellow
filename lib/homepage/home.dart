import 'package:flutter/material.dart';
import 'assetshome/songCard.dart';
import '../neubox/neubox.dart';
import '../sidemenu/sidebarr.dart';
import 'assetshome/ToggleSwitch.dart';
import '../theme/theme.dart';

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  MellowTheme theme = new MellowTheme();
  bool _isSidebarOpen = false;
  bool _isToggleSwitchOpen = false;
  bool isSongPlaying = false;

  //settheme color
  void switchmode() {
    setState(() {
      _isToggleSwitchOpen = !_isToggleSwitchOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isToggleSwitchOpen ? theme.Nmellow1 : theme.Dmellow1,
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: _isToggleSwitchOpen
                    ? [theme.Nmellow1, theme.Nmellow2]
                    : [theme.Dmellow1, theme.Dmellow3],
              ),
            ),
          ),
          SongCard(),
          Align(
            alignment: const Alignment(0.85, -0.92),
            child: SizedBox(
                width: 70,
                height: 30,
                child: ToggleSwitch(
                  switchmode: switchmode,
                )),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isSidebarOpen = !_isSidebarOpen;
              });
            },
            child: Align(
              alignment: Alignment(-1, -1),
              child: SizedBox(
                  width: 60,
                  height: 60,
                  child: neubox(borderRadius:BorderRadius.circular(16) ,width: 40, child: Icon(Icons.menu))),
            ),
          ),
          AnimatedPositioned(
              duration:
                  const Duration(milliseconds: 0), // Set the animation duration
              curve: Curves.easeInOut, // Set the animation curve
              left: _isSidebarOpen ? 0 : -400,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isSidebarOpen = !_isSidebarOpen;
                  });
                },
                child: Container(
                  height: 720,
                  width: 400,
                  color: Colors.transparent,
                ),
              )),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: _isSidebarOpen ? 0 : -300,
              top: 75,
              child: sidebarr(
                theme: _isToggleSwitchOpen,
                returnPlay: () {
                  setState(() {
                    _isSidebarOpen = !_isSidebarOpen;
                  });
                },
              )),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Icon(Icons.skip_previous, size: 50),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSongPlaying = !isSongPlaying;
                          });
                        },
                        child: neubox(
                          shape:BoxShape.circle,
                          child: Icon(
                            color:_isToggleSwitchOpen?theme.blackM:Colors.white,
                            isSongPlaying ? Icons.pause : Icons.play_arrow,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Icon(Icons.skip_next, size: 50)),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
