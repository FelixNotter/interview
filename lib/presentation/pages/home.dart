import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interview/data/models/joke_models.dart';
import 'package:interview/presentation/widgets/joke_card.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List jokes = [];

  @override
  void initState() {
    // TODO: implement initSt
    // ate
    for (var i = 0; i < 5; i++){
        getResponse("https://v2.jokeapi.dev/joke/Any?type=single").then((value) {
      jokes.add(Joke.fromJson(value));
     
    });
    }
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    

    

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Just For Laughs',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return JokeCard(
            category: jokes[index].category,
            type: jokes[index].type,
            joke_text: jokes[index].joke_text,
            flags: jokes[index].flags,
          );
        },
      ),
    );
  }
}

Future<Map<String, dynamic>> getResponse(url) async {
  final response = await http.get(Uri.parse(url));
  var responseData = json.decode(response.body);

  return responseData;
}
