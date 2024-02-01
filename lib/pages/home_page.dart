import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sound_player/components/my_drwer.dart';
import 'package:sound_player/models/playList_provider.dart';
import 'package:sound_player/models/song.dart';
import 'package:sound_player/pages/song_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playListProvider;

  @override
  void initState() {
    super.initState();

    playListProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    //update the currentSongIndex
    playListProvider.setCurrentSongIndex(songIndex);
    // playListProvider.currentSongIndex=songIndex;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SongPage()));
    //navigateTo
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.background,
      appBar: AppBar(
        title: Text(" P L A Y L I S T"),
      ),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(builder: (context, value, child) {
        //get the play list
        List<Song> playList = value.playlist;
        //return listViweBuilder
        return ListView.builder(
            itemCount: playList.length,
            itemBuilder: (context, index) {
              // get indivisualSong
              final Song song = playList[index];

              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(
                  song.albumArtImagePath,
                ),
                onTap: () {
                  goToSong(index);
                },
              );
            });
      }),
    );
  }
}
