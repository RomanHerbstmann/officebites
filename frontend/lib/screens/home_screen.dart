import 'package:flutter/material.dart';
import 'package:office_bites/screens/drawer.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:office_bites/variables/variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.changeTheme,
    required this.getTheme,
  });
  final VoidCallback changeTheme;
  final Function getTheme;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Office Bites"),
      ),
      drawer: MyDrawer(
        changeTheme: widget.changeTheme,
        getTheme: widget.getTheme,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  constraints: const BoxConstraints(
                    maxHeight: 400,
                    maxWidth: 1024,
                  ),
                  child: FlutterMap(
                    options: MapOptions(
                      center: const LatLng(51.950611, 7.638391),
                      zoom: 15,
                    ),
                    nonRotatedChildren: [
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () => launchUrl(Uri.parse(
                                'https://openstreetmap.org/copyright')),
                          ),
                        ],
                      ),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
