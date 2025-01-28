import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vd_music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlists = [
    // Song 1
    Song(
      title: "NEW LIFE",
      artistName: "VANNDA",
      albumName: "Skull III",
      albumArtImagePath: "assets/images/s1.png",
      audioPath: "audio/NEW_LIFE.mp3",
    ),

    // Song 2
    Song(
      title: "J+O ZERO III",
      artistName: "VANNDA",
      albumName: "Skull III",
      albumArtImagePath: "assets/images/s2.png",
      audioPath: "audio/JO_ZERO_III.mp3",
    ),

    // Song 3
    Song(
      title: "BAD LIL BOO",
      artistName: "VANNDA",
      albumName: "Skull III",
      albumArtImagePath: "assets/images/s3.png",
      audioPath: "audio/BAD_LIL_BOO.mp3",
    ),

    // Song 4
    Song(
      title: "SANGKRAN MAGIC",
      artistName: "VANNDA",
      albumName: "Skull III",
      albumArtImagePath: "assets/images/s4.png",
      audioPath: "audio/SANGKRAN_MAGIC.mp3",
    )
  ];

  // current song playing index
  int? _currentSongIndex;

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration? _currentDuration = Duration.zero;
  Duration? _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playlists[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop current song
    await _audioPlayer.play(AssetSource(path)); // play new song
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific position in the current song
  void seekTo(Duration position) async {
    await _audioPlayer.seek(position);
    notifyListeners();
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      // got to the next song if it's not the last song
      if (_currentSongIndex! < _playlists.length - 1) {
        setCurrentSongIndex = _currentSongIndex! + 1;
      } else {
        // if it's the last song, loop back to the first song
        setCurrentSongIndex = 0;
      }
    }
  }

  // play previous song
  void playPreviousSong() async {
    // if more than 2 seconds have passed, restart the current song
    if (_currentDuration!.inSeconds > 2) {
      await _audioPlayer.seek(Duration.zero);
    } else {
      // if it's within first 2 seconds of the song, go previous song
      if (_currentSongIndex! > 0) {
        setCurrentSongIndex = _currentSongIndex! - 1;
      } else {
        // if it's the first song, loop back to the last song
        setCurrentSongIndex = _playlists.length - 1;
      }
    }
  }

  // listen to duration
  void listenToDuration() {
    // listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // dispose audio player

  //! G E T T E R S

  List<Song> get playlists => _playlists;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration? get currentDuration => _currentDuration;
  Duration? get totalDuration => _totalDuration;

  //? S E T T E R S

  set setCurrentSongIndex(int? newIndex) {
    // update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // play the song at the new index
    }

    notifyListeners();
  }
}
