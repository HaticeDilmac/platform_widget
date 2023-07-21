import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TargetPlatform.android == defaultTargetPlatform
          ? const AndroidHomePage() //Use android device
          : DefaultHomePage(), // Use a default widget for iOS.
    );
  }
}

class AndroidHomePage extends StatelessWidget {
  const AndroidHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Android Anasayfa'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBannerWidget(),
          const SizedBox(height: 20),
          _buildListWidget(),
        ],
      ),
    );
  }

  Widget _buildBannerWidget() {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Banner',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildListWidget() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10, // Listenin eleman sayısı
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Liste Elemanı $index'),
            subtitle: Text('Liste Elemanı Açıklaması $index'),
            leading: const Icon(Icons.list),
            onTap: () {
              // Elemana tıklandığında yapılacak işlemler
            },
          );
        },
      ),
    );
  }
}

//Default Device Widget
class DefaultHomePage extends StatelessWidget {
  final List<String> quotes = [
    "Hayatta en hakiki mürşit ilimdir.",
    "Hayat, bir kitaptır ve o kitapta yalnızca bir kez okunabilir.",
    "Kendini bilen Rabbini bilir.",
    "Ya olduğun gibi görün, ya göründüğün gibi ol.",
    "Akıllı insanlar düşünce ve mantıkla hareket ederler, aptallar ise duygularıyla."
  ];

  DefaultHomePage({super.key});

  String getRandomQuote() {
    final Random random = Random();
    int index = random.nextInt(quotes.length);
    return quotes[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('iOS Anasayfa'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount:
              5, // Burada liste eleman sayısını istediğiniz gibi ayarlayabilirsiniz
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  title: Text(
                    getRandomQuote(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
