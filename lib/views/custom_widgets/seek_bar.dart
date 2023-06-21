import 'dart:math';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SeekBarData{
  final Duration position;
  final Duration duration;
  final AudioPlayer player;

  SeekBarData(this.position,this.duration,this.player);
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;
  final AudioPlayer player;

  SeekBar({Key? key,
    required this.position,
    required this.duration,
    this.onChanged,
    this.onChangeEnd,
    required this.player}) : super(key: key);

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {

  double? _dragValue;
  String _formatDuaration(Duration? duration){
    if(duration == null){
      return '--:--';
    }
    else{
      String minutes = duration.inMinutes.toString().padLeft(2,'0');
      String seconds = duration.inSeconds.remainder(60).toString().padLeft(2,'0');
      return '$minutes: $seconds';
    }
  }


  @override
  Widget build(BuildContext context) {
    double max = widget.duration.inMilliseconds.toDouble();
    return Row(
      children: [
        Text(_formatDuaration(widget.position)),
        Expanded(
          child: SliderTheme(data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              thumbShape: RoundSliderThumbShape(
                  disabledThumbRadius: 4,
                  enabledThumbRadius: 4
              ),
              overlayShape: RoundSliderOverlayShape(
                  overlayRadius: 10
              ),
              activeTrackColor: Colors.white.withOpacity(0.2),
              inactiveTrackColor: Colors.white,
              thumbColor: Colors.white,
              overlayColor: Colors.white
          ), child: Slider(
            min: 0.0,
            max: max,

            value: _dragValue ?? widget.position.inMilliseconds.toDouble(),
            onChanged: (value){
              setState((){
                _dragValue = value;
              });
              if(widget.onChanged != null){
                widget.onChanged!(
                    Duration(
                        microseconds: value.round()
                    )
                );
              }

              if(value != null){
                widget.player.seek(Duration(microseconds: value.round()));
              }
            },

            onChangeEnd: (value){
              if(widget.onChanged != null){
                widget.onChanged!(
                    Duration(
                        microseconds: value.round()
                    )
                );
              }

              // if(value != null){
              //   widget.player.seek(Duration(microseconds: value.round()));
              // }
              // if(widget.player.position != Duration(microseconds: value.round())
              // || widget.player.duration != null){
              //   widget.player.seek(Duration(microseconds: value.round()));
              // }
              _dragValue = null;
            },
          )),
        ),
        Text(_formatDuaration(widget.duration))

      ],
    );
  }
}
