import 'package:flutter/material.dart';

class templateSideBar extends StatefulWidget {
  final bool theme;
  const templateSideBar({super.key, required this.theme});

  @override
  State<templateSideBar> createState() => _templateSideBarState();
}

class _templateSideBarState extends State<templateSideBar> {
  bool openAbout = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.theme? Colors.green.shade100:Colors.red.shade100,
      body: Stack(children: [
        SafeArea(
            child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 90,
                width: 400,
                color: widget.theme? Colors.green.shade200:Colors.red.shade200,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.settings,
                        size: 70,
                        color: widget.theme? Colors.green.shade400:Colors.red.shade400,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "Setting",
                      style:
                          TextStyle(fontSize: 30, color: widget.theme? Colors.green.shade400:Colors.red.shade400),
                      textAlign: TextAlign.center,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel,
                          size: 55,
                          color: widget.theme? Colors.green.shade400:Colors.red.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: widget.theme? Colors.green.shade400:Colors.red.shade400,
              height: 0,
              thickness: 6,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  openAbout = !openAbout;
                });
              },
              child: Container(
                height: 80,
                width: 400,
                color: widget.theme? Colors.green.shade100:Colors.red.shade100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "about",
                      style:
                          TextStyle(fontSize: 30, color: widget.theme? Colors.green.shade300:Colors.red.shade300),
                    ),
                    SizedBox(
                      width: 200,
                    ),
                    Expanded(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 50,
                        color: widget.theme? Colors.green.shade300:Colors.red.shade300,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: widget.theme? Colors.green.shade400:Colors.red.shade400,
              height: 0,
              thickness: 6,
            ),
            SizedBox(
              height: 80,
            ),
            Divider(
              color: widget.theme? Colors.green.shade400:Colors.red.shade400,
              height: 0,
              thickness: 6,
            ),
            SizedBox(
              height: 80,
            ),
            Divider(
              color: widget.theme? Colors.green.shade400:Colors.red.shade400,
              height: 0,
              thickness: 6,
            ),
            SizedBox(
              height: 80,
            ),
            Divider(
              color: widget.theme? Colors.green.shade400:Colors.red.shade400,
              height: 0,
              thickness: 6,
            ),
            SizedBox(
              height: 80,
            ),
            Divider(
              color: widget.theme? Colors.green.shade400:Colors.red.shade400,
              height: 0,
              thickness: 6,
            ),
            SizedBox(
              height: 80,
            ),
            Divider(
              color: widget.theme? Colors.green.shade400:Colors.red.shade400,
              height: 0,
              thickness: 6,
            ),
            SizedBox(
              height: 80,
            ),
            Divider(
              color: widget.theme? Colors.green.shade400:Colors.red.shade400,
              height: 0,
              thickness: 6,
            ),
          ],
        )),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300), // Set the animation duration
          curve: Curves.easeInOut, // Set the animation curve
          bottom: openAbout ? 200 : -300,
          left: 50,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  color: widget.theme? Colors.green.shade100:Colors.red.shade100,
                  boxShadow: [
                    BoxShadow(
                        color: widget.theme? Colors.green.shade600:Colors.red.shade600,
                        blurRadius: 15,
                        offset: Offset(5, 5)),
                  ],
                  borderRadius: BorderRadius.circular(12)),
              height: 300,
              width: 300,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        color: widget.theme? Colors.green.shade200:Colors.red.shade200),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    openAbout = !openAbout;
                                  });
                                },
                                child: Icon(
                                  Icons.cancel,
                                  size: 40,
                                  color: widget.theme? Colors.green.shade400:Colors.red.shade400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: widget.theme? Colors.green.shade600:Colors.red.shade600,
                    thickness: 3,
                    height: 1,
                  ),
                  Row(
                    children: [
                      Text("VERSION",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.start),
                      Expanded(
                          child: Text("1.0.0",
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.end))
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "MELLOW",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "MELODY",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
