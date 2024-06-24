import 'package:flutter/material.dart';

class JokeCard
 extends StatelessWidget {
  final String category;
  final String type;
  final String joke_text;
  final Map<String,dynamic> flags;
  JokeCard
  ({super.key,
  required this.category,
  required this.type,
  required this.joke_text,
  required this.flags,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
   
        decoration: 
        BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: 
        Column(
          children: [
            SizedBox(height: 13.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(this.category,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
                  Text(this.type,style: 
                  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),),              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                this.joke_text,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: 
                [
                 for (var flag in flags.entries)
                  if (flag.value as bool)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Chip(
                        label: Text(flag.key,
                        style: TextStyle(
                          fontSize: 10,
                        ),),
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}