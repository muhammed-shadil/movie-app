import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_details_model.dart';

class MovieDetailsEnd extends StatelessWidget {
  const MovieDetailsEnd({
    super.key,
    required this.moviedetail,
  });

  final MovieDetails moviedetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      width: MediaQuery.of(context).size.width,
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
                    color: const Color.fromARGB(255, 61, 61, 60),
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
            padding: const EdgeInsets.symmetric(horizontal: 4),
            margin: const EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 59, 58, 58)),
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.av_timer,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:
                            Text('${moviedetail.runtime.toString()} minutes'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 232, 185, 46),
                        size: 17,
                      ),
                      Text(moviedetail.voteAverage.toString()),
                    ],
                  ),
                  moviedetail.adult
                      ? Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red)),
                          child: const Text(
                            "18+",
                            style: TextStyle(color: Colors.red),
                          ))
                      : Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue)),
                          child: const Text(
                            "U/-",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                ],
              ),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviedetail.production.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(66, 227, 221, 221)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(6),
                    child: Text(moviedetail.production[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
