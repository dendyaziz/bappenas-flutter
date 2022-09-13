import 'package:flutter/material.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  static const movieList = [
    {
      'name': 'Fast & Furious Presents: Hobbs & Shaw',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
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
            MovieCard(
              title: 'Fast & Furious Presents: Hobbs & Shaw',
              imageUrl:
                  'https://m.media-amazon.com/images/M/MV5BOTIzYmUyMmEtMWQzNC00YzExLTk3MzYtZTUzYjMyMmRiYzIwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SX300.jpg',
              category: 'Movie',
              rating: 7.8,
            ),
            MovieCard(
              title: 'Fast & Furious Presents: Hobbs & Shaw',
              imageUrl:
                  'https://m.media-amazon.com/images/M/MV5BOTIzYmUyMmEtMWQzNC00YzExLTk3MzYtZTUzYjMyMmRiYzIwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SX300.jpg',
              category: 'Movie',
              rating: 7.8,
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
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: Colors.blue,
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
