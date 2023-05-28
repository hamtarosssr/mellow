import 'package:flutter/material.dart';

void main() {
  runApp(MusicApp());
}

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String currentSongName = 'Current Song';
    final String currentArtistName = 'Artist Name';

    return Scaffold(
      appBar: AppBar(
        title: Text('Music App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16.0),
          Text(
            currentSongName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            currentArtistName,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // Handle favorite/unfavorite song
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.loop),
              onPressed: () {
                // Handle loop functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.skip_previous),
              onPressed: () {
                // Handle previous song
              },
            ),
            IconButton(
              icon: Icon(Icons.play_circle_filled),
              onPressed: () {
                // Handle play/pause song
              },
            ),
            IconButton(
              icon: Icon(Icons.skip_next),
              onPressed: () {
                // Handle next song
              },
            ),
            IconButton(
              icon: Icon(Icons.playlist_play),
              onPressed: () {
                // Navigate to playlist screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaylistPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PlaylistPage extends StatefulWidget {
  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  List<Genre> genres = [
    Genre(
      name: 'Pop',
      songs: ['Song 1', 'Song 2', 'Song 3','song 4 '], // Replace with your pop songs
    ),
    Genre(
      name: 'Rock',
      songs: ['Song 4', 'Song 5', 'Song 6','song 7'], // Replace with your rock songs
    ),
    Genre(
      name: 'Hip Hop',
      songs: ['Song 7', 'Song 8', 'Song 9', 'song 10'], // Replace with your hip hop songs
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ExpansionPanelList(
                  elevation: 1,
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      genres[index].isExpanded = !isExpanded;
                    });
                  },
                  children: genres.map<ExpansionPanel>((Genre genre) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(genre.name),
                        );
                      },
                      body: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: (genre.songs.length / 2).ceil(),
                        itemBuilder: (BuildContext context, int index) {
                          final int startIndex = index * 2;
                          final int endIndex = startIndex + 1;
                          final List<String> songs = genre.songs.sublist(
                              startIndex,
                              endIndex < genre.songs.length
                                  ? endIndex + 1
                                  : endIndex);

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: songs.map((String songName) {
                              return Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.music_note),
                                      Text(songName),
                                      Text('Playlist Artist'),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.favorite_border),
                                            onPressed: () {
                                              // Handle favorite/unfavorite playlist song
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.play_arrow),
                                            onPressed: () {
                                              // Handle preview music
                                              // You can add your logic here to play a preview of the song
                                              print(
                                                  'Playing preview of $songName');
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                      isExpanded: genre.isExpanded,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Genre {
  String name;
  List<String> songs;
  bool isExpanded;

  Genre({
    required this.name,
    required this.songs,
    this.isExpanded = false,
  });
}
