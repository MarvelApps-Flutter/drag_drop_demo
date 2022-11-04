import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Column(
        //   children: [
        //     Text("data",style: TextStyle(
        //       color: Colors.grey
        //     ),),
        //     Text("data",style: TextStyle(
        //       color: Colors.grey
        //     ),)
        //   ],
        // ),
        titleSpacing: 20,
        elevation: 0,
        title: Row(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Photozz App",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10
                ),),
                Text("Sprint #43",style: TextStyle(
                  color: Colors.black,
                   fontSize: 18
                ),)
              ],
            ),
            SizedBox(width: 20,),
            Icon(Icons.keyboard_arrow_down_outlined,color: Colors.grey,)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: Icon(Icons.search,color: Colors.grey,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 20),
            child: Icon(Icons.settings_outlined,color: Colors.grey,),
          )
        ],
      ),
    );
  }
}