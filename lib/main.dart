import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Mengimpor halaman lain
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_headset.dart' as headset;
import './hal_smartphone.dart' as smartphone;

void main() {
  runApp(MaterialApp(
    title: "Tab Bar",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  // Mengubah menjadi StatefulWidget
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller; // Menggunakan null safety

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 4); // Inisialisasi di sini
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Daftar Elektronik"),

        //tabs bagian atas
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.computer),
              text: "Komputer",
            ),
            Tab(
              icon: Icon(Icons.headset),
              text: "Headset",
            ),
            Tab(
              icon: Icon(Icons.radio),
              text: "Radio",
            ),
            Tab(
              icon: Icon(Icons.smartphone),
              text: "Smartphone",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          komputer
              .Komputer(), // Pastikan hal_komputer.dart memiliki kelas KomputerPage
          headset
              .Headset(), // Pastikan hal_headset.dart memiliki kelas HeadsetPage
          radio.Radio(), // Pastikan hal_radio.dart memiliki kelas RadioPage
          smartphone
              .Smartphone(), // Pastikan hal_smartphone.dart memiliki kelas SmartphonePage
        ],
      ),

      //tabs bagian bawah
      bottomNavigationBar: Material(
        color: Colors.amber,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.computer),
              text: "Komputer",
            ),
            Tab(
              icon: Icon(Icons.headset),
              text: "Headset",
            ),
            Tab(
              icon: Icon(Icons.radio),
              text: "Radio",
            ),
            Tab(
              icon: Icon(Icons.smartphone),
              text: "Smartphone",
            ),
          ],
        ),
      ),
    );
  }
}
