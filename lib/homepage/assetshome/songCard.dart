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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          SizedBox(
                    height: 10,
                  ),
          Text(
            'Mellow',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 25,),
          neubox(
            borderRadius:BorderRadius.circular(30),
            width: 400,
            theme: [Colors.red, Colors.red],
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/brunomars.jpg',
                    height: 450,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment(-0.5,0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              'Lazy Song',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Bruno Mars',
                              style: TextStyle(
                                  fontSize: 20,
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
                            size: 32,
                          ),
                        ),
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                            color: isFavorite ? Colors.red : Colors.grey,
                            size: 32,
                          ),
                        ),
                        SizedBox(width: 10,)
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
