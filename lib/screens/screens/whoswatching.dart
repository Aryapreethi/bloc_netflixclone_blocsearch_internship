import 'package:flutter/material.dart';

import 'home/home/nav.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<String> items = List.generate(5, (index) => '$index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Image.asset(
            'lib/assets/image/netflix-logo-png-large.png',
            height: 80,
            width: 80,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.mode_edit_outline_outlined))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 8, right: 8),
          child: Column(
            children: [
              Text(
                "who's Watching",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppNavScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'lib/assets/image/who.png',
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ),
                        Text("profile$index"),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
