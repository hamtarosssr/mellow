import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class songbar extends StatefulWidget {
  //final Callback returnman;
  String? nameSong;
  bool isFavorite;
  String whatIsThis;
  bool isSongPlaying;
  double? height;

  songbar(
      {super.key,
      this.height,
      this.nameSong,
      required this.isFavorite,
      required this.whatIsThis,
      required this.isSongPlaying,});

  @override
  State<songbar> createState() => _songbarState();
}

class _songbarState extends State<songbar> {
  bool havesong = false;
  Color c1 = Colors.green;
  Color c2 = Colors.green;
  Color c3 = Colors.green;
  double height1 = 80;
  @override
  void initState() {
    if (widget.nameSong != null) {
      havesong = true;
    }
    if (widget.whatIsThis == "song") {
      c1 = Colors.red.shade100;
      c2 = Colors.red.shade400;
      c3 = Colors.red.shade300;
    } else if (widget.whatIsThis == "nature") {
      c1 = Colors.green.shade100;
      c2 = Colors.green.shade400;
      c3 = Colors.green.shade300;
    }
    if (widget.height != null) {
      height1 = widget.height!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 400,
        color: c1,
        child: havesong
            ? Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 210,
                          height: 40,
                          child: SingleChildScrollView(
                            child: Text(
                              widget.nameSong!,
                              style: TextStyle(fontSize: 30, color: c2),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => setState(() {
                            widget.isFavorite = !widget.isFavorite;
                          }),
                          child: Icon(
                            Icons.favorite,
                            size: 60,
                            color: widget.isFavorite ? c3 : Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.isSongPlaying = !widget.isSongPlaying;

                            });
                          },
                          child: Icon(
                            widget.isSongPlaying
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                            size: 60,
                            color: c3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: c2,
                    height: 0,
                    thickness: 6,
                  ),
                ],
              )
            : Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Divider(
                    color: c2,
                    height: 0,
                    thickness: 6,
                  ),
                ),
              ));
  }
}
