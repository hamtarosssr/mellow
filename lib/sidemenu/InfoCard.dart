import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InfoCard extends StatefulWidget {
  final String username1;
  const InfoCard({Key? key, required this.username1}) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  late final TextEditingController controller;
  
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.username1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("INFOCARD"),
      ),
      body: SingleChildScrollView(
        // add SingleChildScrollView
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      CupertinoIcons.person,
                      size: 80,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                //TextField
                TextField(
                  maxLength: 9,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Your name',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),

                //username
                const SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context, controller.text);
                  },
                  color: Colors.blue,
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
