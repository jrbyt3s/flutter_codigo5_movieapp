import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/utils/constans.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 26,
        width: 26,
        child: CircularProgressIndicator(
          color: kBrandSecondaryColor,
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
