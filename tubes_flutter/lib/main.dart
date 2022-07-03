import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tubes_flutter/bottom_bar.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kita Liburan',
        // home: HalamanLogin(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HalamanLogin(),
          '/home': (context) => const BottomBar(),
        });
  }
}

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({Key? key}) : super(key: key);

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin> {
  final formKey = GlobalKey<FormState>();
  TextEditingController txtUser = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text("TUBES"),
        // ),
        body: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(20),
                    child: const Text("Kita Liburan",
                        style: TextStyle(fontSize: 40))),
                const Text("Masuk",
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    controller: txtUser,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Username',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username haruslah diisi';
                      }
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    controller: txtPass,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Password',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password haruslah diisi';
                      }
                    },
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Belum punya akun? Registrasi"),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // Navigator.pushNamed(context, '/home');
                              var username = txtUser.text;
                              Navigator.pushNamed(
                                context,
                                '/home',
                                arguments: {'username': username},
                              );
                            }
                          },
                          child: const Text('Masuk'),
                        ),
                      ],
                    ))
              ],
            )));
  }
}
