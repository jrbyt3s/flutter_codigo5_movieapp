import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_codigo5_movieapp/models/movie_model.dart';
import 'package:flutter_codigo5_movieapp/sevices/api_service.dart';
import 'package:flutter_codigo5_movieapp/ui/widgets/item_filter_widget.dart';
import 'package:flutter_codigo5_movieapp/ui/widgets/item_movie_list_widget.dart';

import '../models/genre_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  List<MovieModel> movieList = [];
  List<MovieModel> moviesListAux = [];
  List<GenreModel> genresList = [];
  final APIService _apiService = APIService();
  int indexFilter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData2();
    //getMovies();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  getData() {
    _apiService.getMovies().then((List<MovieModel> value) {
      movieList = value;
      setState(() {});
      //print(value[3].title);
    });
  }

  getData2() async {
    movieList = await _apiService.getMovies();
    moviesListAux = movieList;
    genresList = await _apiService.getGenres();
    genresList.insert(0, GenreModel(id: 0, name: "All", selected: true));
    indexFilter = genresList[0].id;
    //print(movieList[3].title);
    setState(() {});
  }

  filterMovie() {
    movieList = moviesListAux;
    if (indexFilter != 0) {
      movieList = movieList
          .where((element) => element.genreIds.contains(indexFilter))
          .toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 33, 47),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, John",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Text(
                          "Discover",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(3.5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff5de09c),
                            Color(0xff23dec3),
                          ],
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.network(
                          "https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: genresList
                        .map(
                          (e) => ItemFilterWidget(
                            textFilter: e.name,
                            isSelected: indexFilter == e.id,
                            onTap: () {
                              indexFilter = e.id;
                              print(indexFilter);
                              filterMovie();
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: movieList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemMovieListWidget(
                      movieModel: movieList[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
