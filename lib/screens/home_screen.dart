import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/model/draggable_list.dart';
import '../data/draggable_lists.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  late List<DragAndDropList> lists;

  @override
  void initState() {
    super.initState();

    lists = allLists.map(buildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Color.fromARGB(255, 243, 242, 248);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white
        ),
        backgroundColor: Colors.white,
        titleSpacing: 20,
        elevation: 0,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Photozz App",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.grey)),
                Text("Sprint #43",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black))
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.grey,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 20),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: DragAndDropLists(
        // lastItemTargetHeight: 50,
        // addLastItemTargetHeightToTop: true,
        // lastListTargetSize: 30,
        listPadding: EdgeInsets.all(16),
        listInnerDecoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(10),
        ),
        children: lists,
        itemDivider: Divider(thickness: 2, height: 2, color: backgroundColor),
        itemDecorationWhileDragging: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        listDragHandle: buildDragHandle(isList: true),
        itemDragHandle: buildDragHandle(),
        onItemReorder: onReorderListItem,
        onListReorder: onReorderList,
      ),
    );
  }

  DragHandle buildDragHandle({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.top;
    final color = isList ? Colors.black : Colors.black26;

    return DragHandle(
      verticalAlignment: verticalAlignment,
      child: Container(
        padding: EdgeInsets.only(right: 10,top: 8),
        child: Icon(Icons.more_vert_rounded, color: color),
      ),
    );
  }

  DragAndDropList buildList(DraggableList list) => DragAndDropList(
        header: Container(
          padding: EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(list.image),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 2),
                child: Text(list.header,
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black)),
              ),
            ],
          ),
        ),
        children: list.items
            .map((item) => DragAndDropItem(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    // leading: Image.network(
                    //   item.urlImage!,
                    //   width: 40,
                    //   height: 40,
                    //   fit: BoxFit.cover,
                    // ),
                    title: Row(
                      children: [
                        Text(item.title!,
                            style: TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black)),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "assets/images/bookmark.png",
                          height: 15,
                          width: 15,
                          fit: BoxFit.contain,
                        )
                        //Icon(Icons.bookma)
                      ],
                    ),
                    subtitle: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(item.subTitle!,
                                  style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.grey))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        "assets/images/user_profile1.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        "assets/images/user_profile2.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  const CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        "assets/images/user_profile3.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    "assets/images/chat.png",
                                    height: 21,
                                    width: 21,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // Icon(Icons.chat_bubble_outline,color: Colors.grey,),
                                  Text("1",
                                      style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.black))
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/clip.png",
                                    color: Colors.grey,
                                    height: 23,
                                    width: 23,
                                    fit: BoxFit.contain,
                                  ),
                                  // Icon(
                                  //   Icons.attach_file_sharp,
                                  //   color: Colors.grey,
                                  // ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.menu,
                                    color: Colors.grey,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
      );

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = lists[oldListIndex].children;
      final newListItems = lists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = lists.removeAt(oldListIndex);
      lists.insert(newListIndex, movedList);
    });
  }
}
