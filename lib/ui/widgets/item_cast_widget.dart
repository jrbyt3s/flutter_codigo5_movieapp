import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/models/cast_model.dart';

class ItemCastWidget extends StatelessWidget {
  CastModel castModel;

  ItemCastWidget({
    Key? key,
    required this.castModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white38,
            radius: 38,
            backgroundImage: NetworkImage(
              castModel.profilePath != ""
                  ? "http://image.tmdb.org/t/p/w500${castModel.profilePath}"
                  : "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png",
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            castModel.originalName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
          Text(
            castModel.character,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
