
import 'package:flutter/material.dart';

class videowidget extends StatelessWidget {
  const videowidget({super.key, });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          child: Image.network(
            'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/31GIcUUcdQPRkVtmdqgQWJMhXj1.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.volume_up_rounded)))
      ],
    );
  }
}
