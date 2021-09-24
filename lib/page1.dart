import 'package:flutter/material.dart';
import 'dart:math';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Random random = new Random();
  int jumlah = 0;
  int status = 0;
  bool siapNikah = false;
  List statusKita = [
    "Hampir Berhasil",
    "Belum Beruntung",
    "Hampir Dapat",
    "YAY BERHASIL",
  ];

  void tambahPacar() {
    setState(() {
      jumlah++;
      status = random.nextInt(3); // 0, 1, 2
      if (jumlah == 20) {
        siapNikah = true;
        status = 3;
      }
      print(jumlah);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tahap PDKT"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/Impostor_Biru.jpg",
                width: 50,
              ),
              Text(
                "Jumlah Pacar:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                jumlah.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Container(
                height: 20,
              ),
              Text(
                "Status:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                statusKita[status],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
              ElevatedButton(
                onPressed: tambahPacar,
                child: Text("Cari Lagi"),
              ),
              Visibility(
                visible: siapNikah,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/page2');
                  }, // Lanjut ke halaman selanjutnya
                  child: Text("Yuk Nikah"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
