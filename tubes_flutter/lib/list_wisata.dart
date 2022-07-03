import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tubes_flutter/detail_wisata.dart';
import 'package:http/http.dart' as http;

Future<List> getData() async {
  final response =
      await http.get(Uri.parse("http://localhost/tubes_flutter/getData.php"));
  return json.decode(response.body);
}

class HalamanListWisata extends StatefulWidget {
  const HalamanListWisata({Key? key}) : super(key: key);

  @override
  State<HalamanListWisata> createState() => _HalamanListWisataState();
}

class _HalamanListWisataState extends State<HalamanListWisata> {
// List Wisata
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? ItemList(
                    list: snapshot.data,
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List? list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
        ),
        itemCount: list?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailWisata(
                        id: list?[index]['id'],
                        namatempat: list?[index]['namatempat'],
                        lokasi: list?[index]['lokasi'],
                        biaya: list?[index]['biaya'],
                        jamoperasional: list?[index]['jamoperasional'],
                        foto: list?[index]['foto'],
                        deskripsi: list?[index]['deskripsi'],
                        latitude: double.parse(list?[index]['latitude']),
                        longitude: double.parse(list?[index]['longitude']),
                      ),
                    ));
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    AspectRatio(
                      child: Image.asset(
                        list?[index]['foto'],
                        fit: BoxFit.cover,
                      ),
                      aspectRatio: 2 / 1,
                    ),
                    ListTile(
                      title: Text(
                        list?[index]['namatempat'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(
                        list?[index]['deskripsi'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            height: 1.5, color: Colors.black.withOpacity(0.6)),
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}

// class wisata {
//   final int id;
//   final String namatempat;
//   final String lokasi;
//   final String biaya;
//   final String jamoperasional;
//   final String deskripsi;
//   final String foto;
//   final double latitude;
//   final double longitude;

//   wisata(this.id, this.namatempat, this.lokasi, this.biaya, this.jamoperasional,
//       this.deskripsi, this.foto, this.latitude, this.longitude);
// }

// final List<wisata> listWisata = [
//   wisata(
//       1,
//       'Monumen Nasional',
//       'Jakarta',
//       '15.000',
//       '08:00-22:00',
//       "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
//       "assets/images/monas.jpg",
//       -6.1753924,
//       106.8271528),
//   wisata(
//       2,
//       'Candi Borobudur',
//       'Magelang',
//       '50.000',
//       '07:30-16:00',
//       "Candi Borobudur adalah salah satu candi Budha di Indonesia yang terletak di Magelang, Jawa Tengah",
//       "assets/images/burbud.jpg",
//       -7.6078685,
//       110.2015626),
//   wisata(
//       3,
//       'Candi Prambanan',
//       'Kabupaten Sleman',
//       '60.000',
//       '08:00-17:00',
//       "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Recusandae, nemo cumque, enim in perspiciatis tenetur unde accusantium beatae distinctio iste aliquid? Dignissimos dolores accusamus perferendis! Aspernatur doloremque distinctio beatae odio enim architecto nihil molestias nam, saepe atque maiores voluptatem esse ea nulla exercitationem et cum commodi quis. Dicta ducimus tempore id at et, assumenda pariatur neque, veritatis eum accusantium earum eius minus veniam recusandae amet architecto. Aut voluptas earum dicta debitis quas voluptatibus eum temporibus non omnis molestias commodi iure doloribus consequatur, minus facere neque? Magni ad debitis nisi voluptate. Corporis, veniam temporibus? Vero sint itaque deserunt explicabo consequuntur perferendis?",
//       "assets/images/prambanan.jpeg",
//       -7.7520153,
//       110.4872402),
//   wisata(
//       4,
//       'Monumen Jogja Kembali',
//       'Kabupaten Sleman',
//       '15.000',
//       '09:00-12:00',
//       "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Fugit totam necessitatibus reiciendis, atque aut cum qui eius perspiciatis labore maxime! Est eligendi dolore rerum perspiciatis doloremque ex sed perferendis beatae dolores earum nisi obcaecati voluptatem, nam impedit id, harum recusandae, ipsam modi quas sapiente incidunt. Recusandae fugit voluptas minus provident, reiciendis nulla nihil aut possimus praesentium, explicabo sunt ea illo repellendus! Sunt at id neque nostrum nesciunt eaque dolore deleniti tempora commodi obcaecati quod sint, tempore et aliquam, illo sed itaque illum possimus expedita facere, minus dolor nihil molestiae placeat?",
//       "assets/images/monjali.jpg",
//       -7.7495851,
//       110.3674181),
// ];

// final List<wisata> listWisata = [];