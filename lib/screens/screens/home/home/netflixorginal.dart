import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:net/bloc/app_bloc.dart';
import 'package:net/bloc/app_event.dart';
import 'package:net/bloc/app_state.dart';
import 'package:net/core/const.dart';
import 'package:net/model/model.dart';
import 'package:net/provider/api.dart';
import 'package:shimmer/shimmer.dart';

class NetflixOrginl extends StatefulWidget {
  const NetflixOrginl({super.key});

  @override
  State<NetflixOrginl> createState() => _NetflixOrginlState();
}

class _NetflixOrginlState extends State<NetflixOrginl> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(Api())..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLodingState) {
            return ShimmerEffect();
          }
          if (state is Error) {
            return Center(
              child: Text("Something Went Wrong"),
            );
          }
          if (state is UserLoadedState) {
            List<Mylist> userlist = state.users;
            return Column(
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
                    itemCount: userlist.length,
                    itemBuilder: (context, index) {
                      final poplist = userlist[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 115, 115, 115),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${Constant.imagurl}${poplist.poster_path}'),
                                  fit: BoxFit.cover)),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          }
          return Container();
        },
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
