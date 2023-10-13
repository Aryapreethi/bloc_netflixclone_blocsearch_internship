import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/core/const.dart';
import 'package:net/model/model.dart';
import 'package:net/provider/homeapi.dart';
import 'package:net/screens/screens/download/bloc/app_bloc.dart';
import 'package:net/screens/screens/download/bloc/app_event.dart';
import 'package:net/screens/screens/download/bloc/app_state.dart';
import 'package:net/screens/screens/home/toprated/Mylist.dart';
import 'package:net/screens/screens/home/home/netflixorginal.dart';
import 'package:net/screens/screens/home/popular/popularlist.dart';
import 'package:shimmer/shimmer.dart';
import '../../../color/color.dart';
import 'playvideo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => DataBloc(HomeaApi()),
        child: BlocProvider(
          create: (context) => DataBloc(HomeaApi())..add(DataloadedEvent()),
          child: BlocBuilder<DataBloc, UserdataState>(
            builder: (context, state) {
              if (state is Dataloding) {
                return Loadinghome();
              }
              if (state is Dataerror) {
                return Center(
                  child: Text("something went wrong"),
                );
              }
              if (state is Dataloaded) {
                List<Mylist> userlist = state.users;
                return Scaffold(
                    backgroundColor: Colors.black,
                    extendBodyBehindAppBar: true,
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: size.height * 0.75,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image: NetworkImage(
                                        '${Constant.imagurl}${userlist[2].poster_path}'),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                Column(
                                  children: [
                                    AppBar(
                                      forceMaterialTransparency: true,
                                      leading: Image.asset(
                                          'lib/assets/image/pngwing.com.png'),
                                      actions: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.collections_bookmark,
                                                size: 30,
                                                color: Kwhite)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 30,
                                            ))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        OutlinedButton(
                                            onPressed: () {},
                                            child: Text("TV Shows",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        OutlinedButton(
                                            onPressed: () {},
                                            child: Text("Movies",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        OutlinedButton(
                                          onPressed: () {},
                                          child: Text("Category",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Column(
                                              children: [
                                                Icon(Icons.add),
                                                Text(
                                                  "myList",
                                                ),
                                              ],
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          viewscreenHome(
                                                              mylist: userlist[
                                                                  2])));
                                            },
                                            color: Kbuttonwhite,
                                            child: Row(children: [
                                              Icon(
                                                Icons.play_arrow,
                                                color: Ktext,
                                                size: 18,
                                              ),
                                              Text(
                                                "Play",
                                                style: TextStyle(
                                                    color: Ktext,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Column(
                                                children: [
                                                  Icon(Icons.info_outline),
                                                  Text("info")
                                                ],
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //MyList
                            SizedBox(
                              height: 10,
                            ),
                            MyListScreen(),
                            SizedBox(
                              height: 10,
                            ),
                            Popularlist(),
                            SizedBox(
                              height: 10,
                            ),
                            NetflixOrginl(),
                          ],
                        ),
                      ),
                    ));
              }
              return Container();
            },
          ),
        ));
  }
}

class Loadinghome extends StatefulWidget {
  const Loadinghome({super.key});

  @override
  State<Loadinghome> createState() => _LoadinghomeState();
}

class _LoadinghomeState extends State<Loadinghome> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 182, 181, 181),
      highlightColor: Color.fromARGB(255, 228, 226, 226),
      child: Container(
        height: size.height * 0.75,
        width: double.infinity,
        color: Colors.grey,
      ),
    );
  }
}
