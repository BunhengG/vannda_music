import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vd_music_player/components/custom_drawer.dart';
import 'package:vd_music_player/components/neu_box.dart';
import 'package:vd_music_player/providers/playlist_provider.dart';

import '../models/song.dart';
import 'song_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // get the playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();
    // get the playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    // update current song index
    playlistProvider.setCurrentSongIndex = songIndex;

    // go to the song screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'V D ~ M u s i c'.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Consumer<PlaylistProvider>(
          builder: (context, value, child) {
            // get playlist
            final List<Song> playlists = value.playlists;

            // return list view UI
            return ListView.builder(
              itemCount: playlists.length,
              itemBuilder: (context, index) {
                // get individual song
                final Song song = playlists[index];

                // return list tile UI
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16,
                  ),
                  child: NeuBox(
                    child: ListTile(
                      title: Text(song.title),
                      subtitle: Text(song.artistName),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(song.albumArtImagePath),
                      ),
                      onTap: () => goToSong(index),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
