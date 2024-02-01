// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:sound_player/models/song.dart';

// class PlayListProvider extends ChangeNotifier {
// //play list of songs
//   final List<Song> _playList = [
//     Song(
//       SongName: "Fatha",
//       artistName: "سورة الفاتحة",
//       albumArtImagePath: "assets/images/ahmed.jpg",
//       audioPath: "assets/images/fatha.mp3",
//     ),
//     Song(
//       SongName: "Nas",
//       artistName: "سورة الناس",
//       albumArtImagePath: "assets/images/adham.jpg",
//       audioPath: "assets/images/nas.mp3",
//     ),
//     Song(
//       SongName: "Falaq",
//       artistName: "سورة الفلق",
//       albumArtImagePath: "assets/images/braa.jpg",
//       audioPath: "assets/images/falaq.mp3",
//     ),
//   ];
//   int? _currentSongIndex;
//   //audio player
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   //duration
//   Duration _currentDuration = Duration.zero;
//   Duration _totalDuration = Duration.zero;
//   //constructor
//   PlayListProvider() {
//     listenToDuration();
//   }
// //initiallyy  not playing
//   bool _isPlaying = false;
//   //playSound
//   void playSound() async {
//     final String path = _playList[_currentSongIndex!].audioPath;
//     await _audioPlayer.stop();
//     await _audioPlayer.play(AssetSource(path));
//     _isPlaying = true;
//     notifyListeners();
//   }

//   //pauseSound
//   void pauseSound() async {
//     await _audioPlayer.pause();
//     _isPlaying = false;
//     notifyListeners();
//   }

//   //resume sound
//   void resumeSound() async {
//     await _audioPlayer.resume();
//     _isPlaying = true;
//     notifyListeners();
//   }

// //pause or resume
//   void pauseOrResume() async {
//     if (_isPlaying) {
//       pauseSound();
//     } else {
//       resumeSound();
//     }
//     notifyListeners();
//   }

// //seek to spcific postion in the current sound
//   void seek(Duration position) async {
//     await _audioPlayer.seek(position);
//   }

// //play next sound
//   void playNextSound() {
//     if (_currentSongIndex != null) {
//       if (_currentSongIndex! < _playList.length - 1) {
//         currentSongIndex = _currentSongIndex! + 1;
//       } else {
//         currentSongIndex = 0;
//       }
//     }
//     // notifyListeners();
//   }

// //play previousSound
//   void playPreviousSound() async {
//     if (_currentDuration.inSeconds > 2) {
//       seek(Duration.zero);
//     } else {
//       if (_currentSongIndex! > 0) {
//         currentSongIndex = _currentSongIndex! - 1;
//       } else {
//         currentSongIndex = _playList.length - 1;
//       }
//     }
//   }

//   //listenToDuration
//   void listenToDuration() {
//     //listen for totalDuration
//     _audioPlayer.onDurationChanged.listen((newDuration) {
//       _totalDuration = newDuration;
//       notifyListeners();
//     });
//     //listen for current Duration
//     _audioPlayer.onPositionChanged.listen((newPossition) {
//       _currentDuration = newPossition;
//       notifyListeners();
//     });
//     //listen for sound completion
//     _audioPlayer.onPlayerComplete.listen((event) {
//       playNextSound();
//     });
//   }

//   /*Getter */

//   List<Song> get playList => _playList;
//   int? get currentSongIndex => _currentSongIndex;
//   bool get isPlaying => _isPlaying;
//   Duration get currentDuration => _currentDuration;
//   Duration get totalDuration => _totalDuration;

//   /*Setter  */

//   set currentSongIndex(int? newIndex) {
//     //update currentSong Index
//     _currentSongIndex = newIndex;
//     if (newIndex != null) {
//       playSound();
//     }
//     //update ui
//     notifyListeners();
//   }
// }

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:sound_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      songName: "Fatha",
      artistName: "سورة الفاتحة",
      albumArtImagePath: "assets/images/fatha.jpg",
      audioPath: "sounds/fatha.mp3",
    ),
   
    Song(
      songName: "Falaq",
      artistName: "سورة الفلق",
      albumArtImagePath: "assets/images/falaq.jpg",
      audioPath: "sounds/falaq.mp3",
    ),
     Song(
      songName: "Nas",
      artistName: "سورة الناس",
      albumArtImagePath: "assets/images/nas.png",
      audioPath: "sounds/nas.mp3",
    ),
  ];

  int? _currentSongIndex;

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  void setCurrentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play();
    }

    notifyListeners();
  }

  // Audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Constructor
  PlaylistProvider() {
    listenToDuration();
  }

  bool _isPlaying = false;

  void play() async {
    final String audioPath = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(audioPath));
    _isPlaying = true;
    notifyListeners();
  }

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void stop() async {
    await _audioPlayer.stop();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }

    notifyListeners();
  }

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  void playNextSong() async {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < playlist.length - 1) {
        setCurrentSongIndex(_currentSongIndex! + 1);
      } else {
        setCurrentSongIndex(0);
      }
    }
    
  }

  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        setCurrentSongIndex(_currentSongIndex! - 1);
      } else {
        setCurrentSongIndex(playlist.length - 1);
      }
    }
    
  }

  void listenToDuration() {
    // Listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // Listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // Listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
}
