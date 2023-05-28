import 'package:flutter/material.dart';

class Anysong extends StatefulWidget {
  final String type;
  final dynamic song;

  Anysong({Key? key, required this.type, this.song = const SizedBox()});

  @override
  State<Anysong> createState() => _AnysongState();
}

class _AnysongState extends State<Anysong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 90,
                width: 400,
                color: Colors.red.shade200,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.auto_awesome,
                        size: 70,
                        color: Colors.red.shade400,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.type,
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.red.shade400,
                          fontFamily: 'JosefinSans',
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.cancel,
                          size: 55,
                          color: Colors.red.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.red.shade400,
                height: 0,
                thickness: 6,
              ),
              Column(
                children: [widget.song],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
