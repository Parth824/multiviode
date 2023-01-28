import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:multiv/view/pages/globes.dart';
import 'package:multiv/view/pages/mulvoide.dart';

class List_of_viode extends StatefulWidget {
  const List_of_viode({super.key});

  @override
  State<List_of_viode> createState() => _List_of_viodeState();
}

class _List_of_viodeState extends State<List_of_viode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            ...Data_Vidoe.k.map(
              (e) => Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Data_Vidoe.i = Data_Vidoe.k.indexOf(e);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => v_k(),
                            ),
                          );
                        },
                        child: Container(
                          height: 200,
                          width: 300,
                          // color: Colors.amber,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(e['i'], fit: BoxFit.fitWidth),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        e['n'],
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
