import 'package:cgv_cinemas/module/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'model/movie_list.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  Future<MovieList?> getMovies() async {
    Response response = await Http.get(
        '/3/movie/now_playing?api_key=520b47b2b90e7800b23b894474e39c37');

    print(response);
    return MovieList.fromJson(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'September',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 25.0),
            Expanded(
              child: FutureBuilder<MovieList?>(
                future: getMovies(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: snapshot.data?.results?.length ?? 0,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        title: snapshot.data?.results?[index].title ?? "",
                        imageUrl:
                            'https://image.tmdb.org/t/p/w200/${snapshot.data?.results?[index].posterPath ?? ""}',
                        category:
                            snapshot.data?.results?[index].releaseDate ?? "",
                        rating: snapshot.data?.results?[index].voteAverage ?? 0,
                        color:
                            index % 2 == 0 ? Colors.blue : Colors.purpleAccent,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container MovieCard({
    required title,
    required imageUrl,
    required category,
    required rating,
    required color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
              child: Image.network(
                imageUrl,
                width: 60.0,
              ),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
