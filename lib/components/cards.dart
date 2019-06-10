import 'package:flutter/material.dart';
import '../data/models.dart';
import 'dart:math';

List<Color> colorList = [
  Colors.blue,
  Colors.green,
  Colors.indigo,
  Colors.red,
  Colors.pink,
  Colors.teal,
  Colors.yellow,
  Colors.deepOrange
];

class NoteCardComponent extends StatelessWidget {
  const NoteCardComponent({
    this.noteData,
    Key key,
  }) : super(key: key);

  final NotesModel noteData;

  @override
  Widget build(BuildContext context) {
    Color color = colorList.elementAt(Random().nextInt(colorList.length));
    return Container(
        margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [buildBoxShadow(color, context)],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).dialogBackgroundColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {},
            splashColor: color.withAlpha(20),
            highlightColor: color.withAlpha(10),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${noteData.title.trim().length <= 20 ? noteData.title.trim() : noteData.title.trim().substring(0, 20) + '...'}',
                    style: TextStyle(
                        fontFamily: 'ZillaSlab',
                        fontSize: 20,
                        fontWeight: noteData.isImportant
                            ? FontWeight.w600
                            : FontWeight.normal),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      '${noteData.content.trim().length <= 30 ? noteData.content.trim() : noteData.content.trim().substring(0, 30) + '...'}',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 14),
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.flag,
                            size: 16,
                            color: noteData.isImportant
                                ? color
                                : Colors.transparent),
                        Spacer(),
                        Text(
                          '${noteData.date.toIso8601String().substring(0, 10)}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade300,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  BoxShadow buildBoxShadow(Color color, BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return BoxShadow(color: Colors.transparent);
    }
    return BoxShadow(
        color: noteData.isImportant == true
            ? color.withAlpha(60)
            : color.withAlpha(25),
        blurRadius: 8,
        offset: Offset(0, 8));
  }
}

class AddNoteCardComponent extends StatelessWidget {
  const AddNoteCardComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
        height: 110,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Add new note',
                            style: TextStyle(
                                fontFamily: 'ZillaSlab',
                                color: Theme.of(context).primaryColor,
                                fontSize: 20),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
