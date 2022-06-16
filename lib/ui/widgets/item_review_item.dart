import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/models/review_model.dart';

class ItemReviewWidget extends StatelessWidget {
  ReviewModel reviewModel;

  ItemReviewWidget({required this.reviewModel});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      textColor: Colors.white,
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      title: Text(
        reviewModel.author,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      subtitle: Row(
        children: [
          Text(
            "${reviewModel.createdAt.toString().substring(0, 10)}",
            style: TextStyle(color: Colors.white54, fontSize: 13.0),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Icon(
            Icons.star,
            color: Colors.white54,
            size: 14.0,
          ),
          Text(
            "${reviewModel.authorDetails.rating.toString()}",
            style: TextStyle(color: Colors.white54, fontSize: 13.0),
          ),
        ],
      ),
      // leading: Icon(Icons.check,),
      children: [
        Text(
          reviewModel.content,
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
