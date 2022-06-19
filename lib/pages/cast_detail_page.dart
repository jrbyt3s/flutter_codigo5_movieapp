import 'package:flutter/material.dart';
import 'package:flutter_codigo5_movieapp/utils/constans.dart';

import '../models/cast_detail_model.dart';
import '../sevices/api_service.dart';
import '../ui/widgets/loading_indicator_widget.dart';

class CastDetailPage extends StatefulWidget {
  int castId;
  CastDetailPage({
    required this.castId,
  });

  @override
  State<CastDetailPage> createState() => _CastDetailPageState();
}

class _CastDetailPageState extends State<CastDetailPage> {
  APIService _apiService = APIService();
  CastDetailModel? castDetailModel;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    _apiService.getCastDetail(widget.castId).then((value) {
      castDetailModel = value;
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kBrandPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      contentPadding: EdgeInsets.zero,
      content: isLoading
          ? const SizedBox(
              height: 300,
              child: LoadingIndicatorWidget(),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${castDetailModel!.profilePath}",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Text(
                        castDetailModel!.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        castDetailModel!.placeOfBirth,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13.0,
                        ),
                      ),
                      Text(
                        castDetailModel!.birthday.toString().substring(0, 10),
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
