import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/model/model.dart';
// import 'package:http/http.dart' as http;
import 'package:net/provider/homeapi.dart';
import 'package:net/screens/screens/home/popular/bloc/app_bloc.dart';
import 'package:net/screens/screens/home/popular/bloc/app_event.dart';
import 'package:net/screens/screens/home/popular/bloc/app_state.dart';
import 'package:shimmer/shimmer.dart';
// import 'dart:convert';

import '../../../../core/const.dart';

class Popularlist extends StatefulWidget {
  const Popularlist({super.key});

  @override
  State<Popularlist> createState() => _PopularlistState();
}

class _PopularlistState extends State<Popularlist> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(HomeaApi()),
      child: BlocProvider(
        create: (context) => MovieBloc(HomeaApi())..add(MovieloadingEvent()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Popular List",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Container(
              height: 200,
              width: 400,
              child: BlocBuilder<MovieBloc,MovieloadState>(
                builder: (context, state) {
                  if (state is MovieloadingState) {
                    return ShimmerEffect();
                  }
                  if (state is MovierrorState) {
                    return Center(
                      child: Text("Something went Wrong"),
                    );
                  }
                  if (state is MovieloadedState) {
                    List <Mylist>popularlist=state.data;
                    return  ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularlist.length,
                  itemBuilder: (context, index) {
                    final pplist = popularlist[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 132, 131, 131),
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${Constant.imagurl}${pplist.poster_path}'),
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

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({super.key});

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 165, 165, 165),
      highlightColor: const Color.fromARGB(255, 194, 194, 194),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Netflix Orignals",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
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
