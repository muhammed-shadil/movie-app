import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/model/movie_details_model.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/api.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    super.key,
    required this.wholedetails,
  });
  final Movie wholedetails;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<MovieDetails> moviesdetails;

  @override
  void initState() {
    print(widget.wholedetails.id);
    moviesdetails = Api().getMoviesdetails(widget.wholedetails.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
            future: moviesdetails,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 50,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Error loading data: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'No data available',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              final moviedetail = snapshot.data!;
              // print(moviedetail.posterPath);
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/original/${moviedetail.backDropPath}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.transparent,
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.9),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: -40,
                              right: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 90,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/original/${moviedetail.posterPath}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )),
                          Positioned(
                              top: 20,
                              left: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                              ))
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 33,
                            ),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: moviedetail.genres.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color:
                                          const Color.fromARGB(255, 61, 61, 60),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.all(6),
                                    child: Text(moviedetail.genres[index]),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                moviedetail.title,
                                style: const TextStyle(
                                    fontFamily: "lato",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              margin: const EdgeInsets.only(top: 5),
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color.fromARGB(255, 59, 58, 58)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.av_timer,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(moviedetail.runtime.toString()),
                                  ),
                                  const Text("minutes"),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 232, 185, 46),
                                    size: 17,
                                  ),
                                  Text(moviedetail.voteAverage.toString()),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                  ),
                                  moviedetail.adult
                                      ? Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.red)),
                                          child: const Text(
                                            "18+",
                                            style: TextStyle(color: Colors.red),
                                          ))
                                      : Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.blue)),
                                          child: const Text(
                                            "U/-",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                        )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Release date"),
                            Text(moviedetail.releaseDate),
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Overview",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              moviedetail.overview,
                              style: const TextStyle(height: 1.3, fontSize: 15),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Budget",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(moviedetail.budget.toString()),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Revenu",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(moviedetail.revenue.toString()),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Production campanies",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(margin: EdgeInsets.only(bottom: 30),
                              height: 50,
                              // MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: moviedetail.production.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    // width:
                                    //     MediaQuery.of(context).size.width * 0.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              66, 227, 221, 221)),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.all(6),
                                    child: Text(moviedetail.production[index])
                                        //  Image.network(
                                        //     "https://image.tmdb.org/t/p/original/${moviedetail.production[index]}",
                                        //     fit: BoxFit.fill,
                                           
                                        //   )
                                       
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
