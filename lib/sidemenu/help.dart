import 'package:flutter/material.dart';

class helppp extends StatefulWidget {
  final bool theme;
  const helppp({Key? key, required this.theme,}) : super(key: key);

  @override
  State<helppp> createState() => _helpppState();
}
class _helpppState extends State<helppp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: widget.theme? Colors.green.shade100:Colors.red.shade100,
            borderRadius: BorderRadius.circular(12)),
        height: 300,
        width: 300,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
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
                              Navigator.of(context).pop();
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
            const SizedBox(height: 10,),
            const SizedBox(child: DefaultTextStyle(style: TextStyle(), child: Text("data"),))
          ],
        ),
      ),
    );
  }
}
