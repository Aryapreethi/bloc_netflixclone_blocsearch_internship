
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/core/const.dart';
import 'package:net/model/model.dart';
import 'package:net/provider/homeapi.dart';
import 'package:net/screens/screens/download/bloc/app_bloc.dart';
import 'package:net/screens/screens/download/bloc/app_event.dart';
import 'package:net/screens/screens/download/bloc/app_state.dart';
// import 'package:http/http.dart' as http;
// import 'package:net/model/model.dart';
import 'package:shimmer/shimmer.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataBloc(HomeaApi()),
      child: BlocProvider(
        create: (context) => DataBloc(HomeaApi())..add(DataloadedEvent()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Top Rated Movies",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Container(
              height: 200,
              width: 400,
              child: BlocBuilder<DataBloc, UserdataState>(
                builder: (context, state) {
                  if (state is Dataloding) {
                    return ShimmerLoadingWidget();
                  }
                  if (state is Dataerror) {
                    return Center(
                      child: Text("Something Went Wrong"),
                    );
                  }
                  if (state is Dataloaded) {
                    List<Mylist> datalist = state.users;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: datalist.length,
                      itemBuilder: (context, index) {
                        final toplist = datalist[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 144, 143, 143),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '${Constant.imagurl}${toplist.poster_path}'),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShimmerLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 173, 172, 172),
      highlightColor: const Color.fromARGB(255, 235, 227, 227),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Rated Movies",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 200,
            width: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
