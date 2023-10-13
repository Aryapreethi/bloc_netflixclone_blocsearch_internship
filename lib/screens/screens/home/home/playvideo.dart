import 'package:flutter/material.dart';
import 'package:net/core/const.dart';
import 'package:net/model/model.dart';
import 'package:net/screens/color/color.dart';

class viewscreenHome extends StatefulWidget {
  final Mylist mylist;

  viewscreenHome({
    super.key,
    required this.mylist,
  });

  @override
  State<viewscreenHome> createState() => _viewscreenHomeState();
}

class _viewscreenHomeState extends State<viewscreenHome> {
  @override
  Widget build(BuildContext context) {
    // var mylist;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.book)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          Stack(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                    '${Constant.imagurl}${widget.mylist.poster_path}',
                  ),
                  fit: BoxFit.cover,
                )),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.volume_up_rounded)))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.mylist.original_title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "New",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "2021",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 20,
                width: 25,
                child: Center(child: Text("18+")),
                color: Color(0Xff212121),
              ),
              SizedBox(
                width: 10,
              ),
              Text("1 season",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("Watch Season 1 Now",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Kbuttonwhite,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  Text(
                    "Resume",
                    style: TextStyle(
                        color: Ktext,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Color(0Xff212121),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.download,
                    color: Kwhite,
                  ),
                  Text(
                    "Download",
                    style: TextStyle(
                        color: Kwhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "S1:E1 Part One: Master and Apprentice",
            style: TextStyle(
                color: Kwhite, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            widget.mylist.overview,
            style: TextStyle(
              color: Kwhite,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            "Cast:Rosario Dawson · Ahsoka Tano ; David Tennant · Huyang ; Natasha Liu Bordizzo · Sabine Wren ; Mary Elizabeth Winstead · Hera Syndulla ; Ray Stevenson",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Column(
                    children: [Icon(Icons.add), Text("MyList")],
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Column(
                    children: [Icon(Icons.thumb_up_alt_outlined), Text("Rate")],
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Column(
                    children: [Icon(Icons.share_sharp), Text("share")],
                  ))
            ],
          )
        ]),
      ),
    );
  }
}
