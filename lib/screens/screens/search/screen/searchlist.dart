import 'package:flutter/material.dart';
import 'package:net/core/const.dart';
import 'package:net/screens/screens/search/searchbloc/SearchnewState.dart';
import 'package:net/screens/screens/search/searchbloc/searchnewBloc.dart';
import 'package:net/screens/screens/search/searchbloc/searchnewEvent.dart';

class Searchview extends StatefulWidget {
  const Searchview({Key? key}) : super(key: key);

  @override
  SearchviewState createState() => SearchviewState();
}

class SearchviewState extends State<Searchview> {
  late SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = SearchBloc();
    _searchBloc.add(Load());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                color: Color(0Xff212121),
                child: TextField(
                  onChanged: (word) {
                    _searchBloc.add(Search(query: word));
                  },
                  decoration: const InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder<SearchState>(
                  stream: _searchBloc.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final state = snapshot.data;

                      if (state is SearchStateLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is SearchStateSuccess) {
                        final searchResults = state.items;
                        print(searchResults);
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchResults.length,
                            itemBuilder: (context, index) {
                              final getlistitem = searchResults[index];
                              return Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            '${Constant.imagurl}${getlistitem.poster_path}',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${getlistitem.original_title}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_circle_outline,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      } else if (state is SearchStateError) {
                        return Center(
                          child: Text('Error: ${state.message}'),
                        );
                      }
                    }
                    return Container(); 
                  },
                ),
              ),
            ]),
          ),
        ),
      
    );
  }
}
