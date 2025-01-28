import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vd_music_player/components/neu_box.dart';
import 'package:vd_music_player/providers/playlist_provider.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key});

  // convert duration into min:sec
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // get current song
        final playlist = value.playlists;

        // get current song index
        final currentSongIndex = playlist[value.currentSongIndex ?? 0];

        // return UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // back button
                      IconButton(
                        onPressed: () {
                          // value.pauseOrResume();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),

                      // title
                      Text(
                        'P L A Y L I S T',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),

                      // menu button
                      IconButton(
                        onPressed: () {
                          // show playlist menu
                          // value.showPlaylistMenu();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.list),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // album artwork
                  NeuBox(
                    child: Column(
                      children: [
                        // image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child:
                              Image.asset(currentSongIndex.albumArtImagePath),
                        ),

                        // song and artist and icon
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // title and artist name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSongIndex.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(currentSongIndex.artistName),
                                ],
                              ),

                              // heart icon
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // song duration progress
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // start time
                            Text(formatTime(value.currentDuration!)),

                            // shuffle icon
                            Icon(
                              Icons.shuffle,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),

                            // repeat icon
                            Icon(
                              Icons.repeat,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),

                            //end time
                            Text(formatTime(value.totalDuration!)),
                          ],
                        ),
                      ),

                      // song duration progress bar
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 3,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0,
                          ),
                        ),
                        child: Slider(
                          min: 0,
                          max: value.totalDuration!.inSeconds.toDouble(),
                          value: value.currentDuration!.inSeconds.toDouble(),
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey.shade400,
                          onChanged: (double double) {},
                          onChangeEnd: (double double) {
                            // sliding has finished, go to that position in song duration
                            value.seekTo(
                              Duration(
                                seconds: double.toInt(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // NOTE: playback controls
                  Row(
                    children: [
                      // skip button
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playPreviousSong,
                          child: NeuBox(
                            child: Icon(
                              Icons.skip_previous,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 25),

                      // play pause button
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: value.pauseOrResume,
                          child: NeuBox(
                            child: Icon(
                              value.isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 25),

                      // skip forward button
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playNextSong,
                          child: NeuBox(
                            child: Icon(
                              Icons.skip_next,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
