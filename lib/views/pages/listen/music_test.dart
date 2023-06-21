import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_audio/just_audio.dart';
import '../../../data/model/song_model.dart';
import '../../../logic/page_manager.dart';
import '../../../logic/services/service_locator.dart';
import '../../custom_widgets/player_button.dart';
import '../../custom_widgets/seek_bar.dart';
import 'music.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
class MTest extends StatefulWidget {

  SongModel songModel;
   MTest({super.key, required this.songModel});

  @override
  State<MTest> createState() => _MTestState();
}

class _MTestState extends State<MTest> {


  AudioPlayer audioPlayer = AudioPlayer();
  setSourceAndPlay()async{
    try{
      await audioPlayer.setAudioSource(ConcatenatingAudioSource(
          children: [
            AudioSource.uri(Uri.parse('asset:${widget.songModel.url}'),)
          ]));
      audioPlayer.play();
    }catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
   // getIt<PageManager>().init();
    setSourceAndPlay();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    getIt<PageManager>().dispose();
    super.dispose();
  }
   Stream<SeekBarData> get _seekBarDataStream =>
       rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
           audioPlayer.positionStream, audioPlayer.durationStream, (Duration position, Duration? duration) {
         return SeekBarData(position, duration ?? Duration.zero,audioPlayer);
       });

  @override
  Widget build(BuildContext context) {
    List<SongModel> song = SongModel.songs;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 450,
              width: 450,
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/' + widget.songModel.image + '.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  ///title
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(widget.songModel.title,
                        style: const TextStyle(fontSize: 30)),
                  )
                  //CurrentSongTitle(),
                ],
              ),
            ),
          ),
          _BackgroundFilter(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MusicPlayer(
                  song:widget.songModel,
                  audioPlayer: audioPlayer,
                  seekBarDataStream: _seekBarDataStream,
                ),
              //  AudioControlButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class _MusicPlayer extends StatelessWidget {
  final Stream<SeekBarData> seekBarDataStream;
  final AudioPlayer audioPlayer;
  final SongModel song;
  SeekBarData? _seekBarData;

  _MusicPlayer({Key? key, required this.seekBarDataStream, required this.audioPlayer, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            child: StreamBuilder<SeekBarData>(
                stream: seekBarDataStream,
                builder:(context, snapshot){
                  final positionData = snapshot.data;
                  if(positionData == null){
                    return Container();
                  }
                  return SeekBar(
                    position: positionData.position,
                    duration:positionData.duration,
                    onChangeEnd: audioPlayer.seek,
                    player: audioPlayer,
                  );
                }
            ),
          ),
          PlayerButtons(audioPlayer: audioPlayer),

        ],
      ),
    );
  }
}
class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0),
            ],
            stops: const [
              0.0,
              0.4,
              0.6
            ]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade200,
                Colors.deepPurple.shade800,
              ]),
        ),
      ),
    );
  }
}
