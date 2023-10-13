import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/bloc/app_bloc.dart';
import 'package:net/bloc/app_event.dart';
import 'package:net/bloc/app_state.dart';
import 'package:net/provider/api.dart';
import 'package:net/core/const.dart';
import 'package:net/model/model.dart';
import 'package:net/screens/color/color.dart';
import 'package:net/screens/screens/home/popular/bloc/app_bloc.dart';
import 'package:net/screens/screens/home/popular/bloc/app_event.dart';
import 'package:net/screens/screens/home/popular/bloc/app_state.dart';
import '../../../provider/homeapi.dart';

class CommingSoonScreen extends StatefulWidget {
  const CommingSoonScreen({super.key});

  @override
  State<CommingSoonScreen> createState() => _CommingSoonScreenState();
}

class _CommingSoonScreenState extends State<CommingSoonScreen> {
  late Future<List<Mylist>> nowplaying;
  late Future<List<Mylist>> datafetching;

  void initState() {
    super.initState();
    nowplaying = HomeaApi().getcomingsoon();
    datafetching = Api().getlistnowplaying();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text("New & Hot"),
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.collections_bookmark,
                      size: 30, color: Kwhite)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  )),
            ],
            bottom: TabBar(
                labelColor: Ktext,
                unselectedLabelColor: Kwhite,
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Kbuttonwhite),
                tabs: [
                  Tab(
                    child: Center(child: Text("🍿Coming Soon")),
                  ),
                  Tab(
                    child: Text(
                      "👀Everyone's watching",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ])),
        body: TabBarView(children: [
          buildcomingsoon(),
          buildeveryonewatching(),
        ]),
      ),
    );
  }

  buildcomingsoon() {
    return BlocProvider(
      create: (context) => MovieBloc(HomeaApi()),
      child: BlocProvider(
        create: (context) => MovieBloc(HomeaApi())..add(MovieloadingEvent()),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: BlocBuilder<MovieBloc, MovieloadState>(
            builder: (context, state) {
              if (state is MovieloadingState) {
                return Center(
                  child: CircularProgressIndicator(strokeWidth: 1,color: Kwhite,),
                );
              }
              if (state is MovierrorState) {
                return Center(child: Text("Something went wrong"));
              }
              if (state is MovieloadedState) {
                List<Mylist> getlist = state.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => comindsoon(
                    snapshot: getlist[index],
                  ),
                  itemCount: getlist.length,
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

// everyone is watching........................................
buildeveryonewatching() {
  return BlocProvider(
    create: (context) => UserBloc(Api()),
    child: BlocProvider(
      create: (context) => UserBloc(Api())..add(LoadUserEvent()),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLodingState) {
              return Center(
                child: CircularProgressIndicator(strokeWidth: 1,color: Kwhite,),
              );
            }
            if (state is Error) {
              return Center(
                child: Text("something went wrong"),
              );
            }
            if (state is UserLoadedState) {
              List<Mylist> getdata = state.users;
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    everyone(snapshot: getdata[index]),
                itemCount: getdata.length,
              );
            }
            return Container();
          },
        ),
      ),
    ),
  );
}

class everyone extends StatefulWidget {
  final Mylist snapshot;

  const everyone({
    super.key,
    required this.snapshot,
  });

  @override
  State<everyone> createState() => _everyoneState();
}

class _everyoneState extends State<everyone> {
  @override
  Widget build(BuildContext context) {
    final datalist = widget.snapshot;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${datalist.original_title}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "${datalist.overview}",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                height: 200,
                color: const Color.fromARGB(255, 126, 125, 125),
                child: Image.network(
                  '${Constant.imagurl}${datalist.backdrop_path}',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.volume_up_rounded)))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Column(children: [
                  Icon(Icons.share),
                  Text("share"),
                ]),
              ),
              IconButton(
                onPressed: () {},
                icon: Column(children: [
                  Icon(Icons.add),
                  Text("MyList"),
                ]),
              ),
              IconButton(
                onPressed: () {},
                icon: Column(children: [
                  Icon(Icons.play_arrow),
                  Text("play"),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//comming sooon.....................................
class comindsoon extends StatefulWidget {
  final Mylist snapshot;

  comindsoon({super.key, required this.snapshot});

  @override
  State<comindsoon> createState() => _comindsoonState();
}

class _comindsoonState extends State<comindsoon> {
  @override
  Widget build(BuildContext context) {
    final getlist = widget.snapshot;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Column(
              children: [
                Center(
                  child: Text("${getlist.release_date}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 133, 132, 132),
                        image: DecorationImage(
                          image: NetworkImage(
                              '${Constant.imagurl}${getlist.poster_path}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.volume_up_rounded)))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text("${getlist.original_title}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Column(
                              children: [
                                Icon(Icons.notifications_none),
                                Text("remind me"),
                              ],
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Column(
                              children: [
                                Icon(Icons.info_outline),
                                Text("info"),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text("${getlist.overview}",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
