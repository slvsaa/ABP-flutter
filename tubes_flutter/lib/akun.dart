import 'package:flutter/material.dart';

class HalamanAkun extends StatelessWidget {
  const HalamanAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: <Widget>[
            const SizedBox(height: 50.0),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/ava.png"),
            ),
            const SizedBox(height: 10.0),
            Text(
              data['username'],
              // 'sil'
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ],
    ));
  }
}
