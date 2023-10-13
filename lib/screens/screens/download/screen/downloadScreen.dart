import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/core/const.dart';
import 'package:net/model/model.dart';
import 'package:net/provider/homeapi.dart';
import 'package:net/screens/screens/download/bloc/app_bloc.dart';
import 'package:net/screens/screens/download/bloc/app_event.dart';
import 'package:net/screens/screens/download/bloc/app_state.dart';
import '../../../color/color.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider<DataBloc>(
      create: (context) => DataBloc(HomeaApi()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Downloads",
              style: TextStyle(color: Kwhite, fontWeight: FontWeight.bold)),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cast,
                  color: Kwhite,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                height: 25,
                width: 25,
                child: Image.asset(
                  'lib/assets/image/who.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        body: BlocProvider(
          create: (context) => DataBloc(HomeaApi())..add(DataloadedEvent()),
          child: BlocBuilder<DataBloc, UserdataState>(
            builder: (context, state) {
              if (state is Dataloding) {
                return Center(
                  child: CircularProgressIndicator(strokeWidth: 2,color: Kwhite,),
                );
              }
              if (state is Dataerror) {
                return Center(
                  child: Text(
                    "Somthing Went Wrong",
                    style: TextStyle(color: Colors.amber),
                  ),
                );
              }
              if (state is Dataloaded) {
                List<Mylist> userlist = state.users;
                return ListView(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.settings,
                              color: Kgrey,
                            )),
                        Text(
                          "Smart Downloads",
                          style: TextStyle(color: Kgrey),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Turn on Downloads for you",
                          style: TextStyle(
                              color: Kwhite,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'We will download movies and shows just for you,so you will always have something to watch.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.width,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Color(0Xff222021),
                              radius: size.width * 0.4,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 33.0, left: 180, top: 50, bottom: 20),
                            child: Transform.rotate(
                              angle: 8 * pi / 100,
                              child: Container(
                                width: size.width * 0.45,
                                height: size.width * 0.55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${Constant.imagurl}${userlist[3].poster_path}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 33.0, right: 180, top: 50, bottom: 20),
                            child: Transform.rotate(
                              angle: -8 * pi / 100,
                              child: Container(
                                width: size.width * 0.45,
                                height: size.width * 0.55,
                                // color: Colors.black,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${Constant.imagurl}${userlist[1].poster_path}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Transform.rotate(
                            angle: 0 * pi / 100,
                            child: Container(
                              width: size.width * 0.50,
                              height: size.width * 0.65,
                              // color: Colors.black,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${Constant.imagurl}${userlist[2].poster_path}'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                              color: Kbuttonblue,
                              onPressed: () {},
                              child: Text(
                                "Set up",
                                style: TextStyle(
                                    color: Kwhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MaterialButton(
                            color: Kbuttonwhite,
                            onPressed: () {},
                            child: Text(
                              "See what you can download",
                              style: TextStyle(
                                  color: Ktext,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
