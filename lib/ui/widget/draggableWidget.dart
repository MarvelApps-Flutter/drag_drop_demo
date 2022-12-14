import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/model/cardItem.dart';
import '../../core/viewmodel/data.dart';
import '../resources/colors.dart';
import '../resources/strings.dart';

class DraggableWidget extends StatelessWidget {
  DraggableWidget({
    Key? key,
    this.i,
  }) : super(key: key);

  final int? i;

  CardItem? item;

  @override
  Widget build(BuildContext context) {
    print(
        'List last index  is ${Provider.of<Data>(context).itemsList.length - 1}');
    return Draggable(
      data: Provider.of<Data>(context).itemsList[i!],
      childWhenDragging: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          elevation: 2.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: i! >= 1
              ? Provider.of<Data>(context)
                  .itemsList
                  .elementAt(
                      (Provider.of<Data>(context).itemsList.length - 1) - 1)
                  .cardColor
              : GRAY_COLOR,
          child: Center(
            child: Text(
              i! >= 1
                  ? '${Provider.of<Data>(context).itemsList.elementAt((Provider.of<Data>(context).itemsList.length - 1) - 1).content}'
                  : NO_ITEMS_LEFT,
              style: TextStyle(fontSize: 25.0, color: WHITE_COLOR),
            ),
          ),
        ),
      ),
      feedback: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Provider.of<Data>(context).itemsList[i!].cardColor,
          child: Center(
              child: Text(
            '${Provider.of<Data>(context).itemsList[i!].content}',
            style: TextStyle(fontSize: 25.0, color: WHITE_COLOR),
          )),
        ),
      ),
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          color: Provider.of<Data>(context).itemsList[i!].cardColor,
          child: Center(
              child: Text(
            '${Provider.of<Data>(context).itemsList[i!].content}',
            style: TextStyle(fontSize: 25.0, color: WHITE_COLOR),
          )),
        ),
      ),
    );
  }
}
