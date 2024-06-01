// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_details_model.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/api.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    Key? key,
    required this.wholedetails,
  }) : super(key: key);
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
      body: SafeArea(
        child: FutureBuilder(
            future: moviesdetails,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                print("yyyyyyyyyyyyyyyyyyyyyyyy");
                return const Center(child: CircularProgressIndicator());
              }
              final moviedetail = snapshot.data!;
              return Container(
                // color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        child: Image.network(
                          "https://image.tmdb.org/t/p/original/${moviedetail.backDropPath}",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        // color: Color.fromARGB(66, 224, 9, 9),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                      color: const Color.fromARGB(255, 218, 217, 214),
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
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.timer),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(moviedetail.runtime.toString()),
                                ),
                                Text("minutes"),
                                SizedBox(
                                  width: 40,
                                ),
                                Icon(Icons.star),
                                Text(moviedetail.voteAverage.toString())
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Release date"),
                            Text(moviedetail.releaseDate),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Story line",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(moviedetail.overview),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Budget"),
                            ),
                            Text(moviedetail.budget.toString()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("revenu"),
                            ),
                            Text(moviedetail.revenue.toString()),
                            Text(moviedetail.revenue.toString())
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
