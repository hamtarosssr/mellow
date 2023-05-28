import 'package:flutter/material.dart';
import '../../neubox/neubox.dart';

class SongCard extends StatefulWidget {
  SongCard({
    super.key,
  });

  @override
  State<SongCard> createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  bool isFavorite = false;
  bool isRepeat = false;
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
     double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 90,
          ),
          neubox(
            borderRadius: BorderRadius.circular(30),
            theme: [Colors.red, Colors.red],
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/brunomars.jpg',
                    height: screenHeight/1.6,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Lazy Song',
                              style: TextStyle(
                                  fontSize: (screenWidth * 0.05)+20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Bruno Mars',
                              style: TextStyle(
                                  fontSize: ((screenWidth * 0.05)/1.5)+20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isRepeat = !isRepeat;
                            });
                          },
                          child: Icon(
                            Icons.repeat,
                            color: isRepeat ? Colors.white : Colors.grey,
                            size: (screenWidth * 0.05)+20,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: (screenWidth * 0.05)+20,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
