import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constans.dart';

class PlayerPage extends StatefulWidget {
  PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late BetterPlayerController _betterPlayerController;
  @override
  void initState() {
    // =========== Bette Player: =================
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 1,
      fit: BoxFit.fill,
      rotation: 0,
      autoPlay: true,
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, forBiggerBlazesUrl);
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    //=========== en Better Player =================
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //const SizedBox(height: 8),
          Expanded(
            child: BetterPlayer(controller: _betterPlayerController),
          ),
        ],
      ),
    );
  }
}
