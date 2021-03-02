import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var pertanyaanke = 0;
  int score = 0;
  String get ketscore {
    String keterangan;
    if (score < 90) {
      keterangan = 'Lumayan lah';
    }
    if (score > 90) {
      keterangan = 'pinter';
    } else if (score == 0) {
      keterangan = 'goblok';
    }
    return keterangan;
  }

  final pertanyaan = const [
    {
      'p': 'Apa warna bendera indonesia?',
      'j': [
        {'jj': 'merah putih', 's': 30},
        {'jj': 'kuning merah', 's': 0},
        {'jj': 'hijau pink', 's': 0}
      ]
    },
    {
      'p': 'Siapa presiden indonesia?',
      'j': [
        {'jj': 'jokowi', 's': 30},
        {'jj': 'Makruf amin', 's': 0},
        {'jj': 'Jusuf kala', 's': 0}
      ]
    },
    {
      'p': 'Siapa wakil presiden indonesia?',
      'j': [
        {'jj': 'tri risma', 's': 0},
        {'jj': 'makruf amin', 's': 40},
        {'jj': 'Prabowo', 's': 0}
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pertanyaanke < pertanyaan.length
          ? Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    score.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    pertanyaan[pertanyaanke]['p'],
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ...(pertanyaan[pertanyaanke]['j']
                          as List<Map<String, Object>>)
                      .map((j) {
                    return Tombol(j['jj'], () => tombol(j['s']));
                  }).toList()
                ],
              ),
            )
          : Container(
              color: score == 100
                  ? Colors.green
                  : score == 0
                      ? Colors.red
                      : Colors.amber,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ketscore,
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Nilai Kamu',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    score.toString(),
                    style: TextStyle(fontSize: 70),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text('Reset'),
                    onPressed: reset,
                  ),
                ],
              ),
            ),
    );
  }

  void tombol(hasil) {
    setState(() {
      pertanyaanke = pertanyaanke + 1;
      score += hasil;
    });
    print(pertanyaanke);
    if (pertanyaanke < pertanyaan.length) {
      print('next');
    } else {
      print('selesai');
    }
  }

  void reset() {
    setState(() {
      pertanyaanke = 0;
      score = 0;
    });
  }
}

// ignore: must_be_immutable
class Tombol extends StatelessWidget {
  Function tombol;
  String title;
  Tombol(this.title, this.tombol);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(title),
        onPressed: tombol,
      ),
    );
  }
}
