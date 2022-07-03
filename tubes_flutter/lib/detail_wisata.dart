import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailWisata extends StatelessWidget {
  final String id;
  final String namatempat;
  final String lokasi;
  final String biaya;
  final String jamoperasional;
  final String deskripsi;
  final String foto;
  final double latitude;
  final double longitude;

  const DetailWisata({
    Key? key,
    required this.id,
    required this.namatempat,
    required this.lokasi,
    required this.biaya,
    required this.jamoperasional,
    required this.deskripsi,
    required this.foto,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Bagian Atas
    final jam = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        jamoperasional,
        style: const TextStyle(color: Colors.white),
      ),
    );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 80.0),
        Expanded(
          child: Container(
            height: 120,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                namatempat,
                style: const TextStyle(color: Colors.white, fontSize: 45.0),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        Container(
          child: jam,
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(foto),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 15.0,
          top: 50.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    // Untuk Maps
    Completer<GoogleMapController> _controller = Completer();

    final CameraPosition peta =
        CameraPosition(target: LatLng(latitude, longitude), zoom: 15);
    final Set<Marker> _markers = {};
    _markers.add(Marker(
        markerId: MarkerId(namatempat),
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(title: namatempat)));

    // Bagian Bawah
    final bottomContent = Container(
      child: Expanded(
        child: Column(
          // padding: const EdgeInsets.all(8),
          children: [
            Card(
                child: ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Biaya'),
              subtitle: Text(biaya),
            )),
            Card(
                child: ListTile(
              leading: const Icon(Icons.description),
              title: const Text('Deskripsi'),
              subtitle: Text(deskripsi),
            )),
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Lokasi'),
                subtitle: Text(lokasi),
              ),
            ),
            Card(
                child: SizedBox(
                    // width: 400,
                    height: 300,
                    child: GoogleMap(
                        mapType: MapType.normal,
                        markers: _markers,
                        initialCameraPosition: peta,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        })))
          ],
        ),
      ),
    );

    final review = Container(
        padding: const EdgeInsets.fromLTRB(40, 15, 40, 20),
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: const Text('Ulasan Pengguna'),
        ));

    return Scaffold(
      body: ListView(
        children: <Widget>[topContent, bottomContent, review],
      ),
    );
  }
}
