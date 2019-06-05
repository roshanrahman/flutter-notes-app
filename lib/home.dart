import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFlagOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Add note'.toUpperCase()),
        icon: Icon(Icons.add),
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.centerRight,
                  icon: Icon(OMIcons.settings),
                  color: Colors.grey,
                  onPressed: () {/* TODO: Settings */},
                ),
              ],
            ),
            buildHeaderWidget(context),
            buildButtonRow(),
            buildImportantIndicatorText(),
            Container(
              height: 32,
            ),
            testListItem(Colors.blue),
            testListItem(Colors.red),
            testListItem(Colors.indigo),
            testListItem(Colors.green),
            testListItem(Colors.purple),
            Container(height: 100)
          ],
        ),
        margin: EdgeInsets.only(top: 2),
        padding: EdgeInsets.only(left: 24, right: 24),
      ),
    );
  }

  Widget buildButtonRow() {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              isFlagOn = !isFlagOn;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: 50,
            width: 50,
            child: Icon(
              OMIcons.flag,
              color: isFlagOn ? Colors.white : Colors.grey.shade300,
            ),
            decoration: BoxDecoration(
                color: isFlagOn ? Colors.blue : Colors.transparent,
                border: Border.all(
                    width: isFlagOn ? 2 : 1,
                    color:
                        isFlagOn ? Colors.blue.shade700 : Colors.grey.shade300),
                borderRadius: BorderRadius.all(Radius.circular(16))),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 8),
            padding: EdgeInsets.only(left: 16),
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: TextField(
              maxLines: 1,
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration.collapsed(
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                border: InputBorder.none,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildHeaderWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 32),
      child: Text(
        'Your Notes',
        style: TextStyle(
            fontFamily: 'ZillaSlab',
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget testListItem(Color color) {
    return Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: color.withAlpha(25), blurRadius: 8, offset: Offset(0, 8))
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
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
                    'Today was a great day',
                    style: TextStyle(fontFamily: 'ZillaSlab', fontSize: 20),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      'Today was a great day',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 14),
                    child: Text(
                      'Today was a great day',
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget buildImportantIndicatorText() {
    if (isFlagOn) {
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          'Only showing notes marked important'.toUpperCase(),
          style: TextStyle(
              fontSize: 12, color: Colors.blue, fontWeight: FontWeight.w500),
        ),
      );
    }
    return Container();
  }
}
