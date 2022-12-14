import 'dart:async';

import 'package:cgv_cinemas/movies.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  var movieCount = 5;

  static const MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-6.3626907128447945, 106.75102741086776),
    zoom: 16,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: white,
        fontFamily: 'Roboto',
      ),
      routes: {
        '/movies': (context) => Movies(),
      },
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(elevation: 0),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 250.0,
                ),
                SizedBox(height: 40.0),
                Text(
                  'Jumlah:',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ),
                ),
                Text(
                  '$movieCount Film',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/movies');
                  },
                  child: Text('Lihat Semua'),
                ),
                Container(
                  height: 300.0,
                  child: GoogleMap(
                    mapType: MapType.satellite,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                movieCount = movieCount + 1;
              });
            },
            child: Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
