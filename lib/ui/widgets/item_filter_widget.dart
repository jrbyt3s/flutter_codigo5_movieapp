import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/pages/movie_detail_page.dart';

class ItemFilterWidget extends StatelessWidget {
  String textFilter;
  bool isSelected;
  ItemFilterWidget(
      {Key? key, required this.textFilter, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12.0, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff23dec3) : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: isSelected ? Color(0xff23dec3) : Colors.white70,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: const Color(0xff23dec3).withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(4, 4),
                ),
              ]
            : [],
        gradient: isSelected
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff5de09c),
                  Color(0xff23dec3),
                ],
              )
            : null,
      ),
      child: Text(
        textFilter,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }
}
