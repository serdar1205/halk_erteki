// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:halk_erteki/data/model/song_model.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:rxdart/rxdart.dart' as rxdart;
// import '../../custom_widgets/player_button.dart';
// import '../../custom_widgets/seek_bar.dart';
//
// class SongScreen extends StatefulWidget {
//   const SongScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SongScreen> createState() => _SongScreenState();
// }
//
// class _SongScreenState extends State<SongScreen> {
//
//   AudioPlayer audioPlayer = AudioPlayer();
//   Song song = Get.arguments ?? Song.songs[0];
//
//   @override
//   void initState(){
//     super.initState();
//     setSourceAndPlay();
//
//   }
//   setSourceAndPlay()async{
//     try{
//       await audioPlayer.setAudioSource(ConcatenatingAudioSource(
//           children: [
//             AudioSource.uri(Uri.parse('asset:${song.url}'),)
//           ]));
//       audioPlayer.play();
//     }catch(e){
//       print(e);
//     }
//   }
//   @override
//   void dispose(){
//     audioPlayer.dispose();
//     super.dispose();
//   }
//   Stream<SeekBarData> get _seekBarDataStream =>
//       rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
//           audioPlayer.positionStream, audioPlayer.durationStream, (Duration position, Duration? duration) {
//         return SeekBarData(position, duration ?? Duration.zero,audioPlayer);
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(song.image, fit: BoxFit.cover,),
//           Image.asset(song.image, fit: BoxFit.cover,),
//
//           _MusicPlayer(
//             song:song,
//             audioPlayer: audioPlayer,
//             seekBarDataStream: _seekBarDataStream,)
//
//
//         ],
//       ),
//     );
//   }
// }
//
// class _MusicPlayer extends StatelessWidget {
//   final Stream<SeekBarData> seekBarDataStream;
//   final AudioPlayer audioPlayer;
//   final Song song;
//   SeekBarData? _seekBarData;
//
//   _MusicPlayer({Key? key, required this.seekBarDataStream, required this.audioPlayer, required this.song}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('song.title',
//             style:Theme.of(context).textTheme.headlineSmall!.copyWith(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold
//             ) ,),
//           SizedBox(height: 10,),
//
//           SizedBox(height: 30,),
//
//           Container(
//             height: 100,
//             child: StreamBuilder<SeekBarData>(
//                 stream: seekBarDataStream,
//                 builder:(context, snapshot){
//                   final positionData = snapshot.data;
//                   if(positionData == null){
//                     return Container();
//                   }
//                   return SeekBar(
//                     position: positionData.position,
//                     duration:positionData.duration,
//                     onChangeEnd: audioPlayer.seek,
//                     player: audioPlayer,
//                   );
//                 }
//             ),
//           ),
//           PlayerButtons(audioPlayer: audioPlayer),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               IconButton(
//                 onPressed: (){},
//                 icon: Icon(Icons.settings , color: Colors.white,),
//                 iconSize: 35,
//               ),
//               IconButton(
//                 onPressed: (){},
//                 icon: Icon(Icons.download , color: Colors.white,),
//                 iconSize: 35,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
