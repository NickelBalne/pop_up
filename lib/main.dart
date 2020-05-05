import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListViewAlertDialog(),
    );
  }
}

class ListViewAlertDialog extends StatelessWidget {
  _displayDialog(BuildContext context, medicineName) async {
    return showDialog(
        context: context,
        builder: (context) {
          var textFormFieldCount = 2;

          var enteredNamesList = [];
          var finalNamesList = [];
          var typedName;

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.blue),
                            )),
                      ),
                      Expanded(
                          flex: 4,
                          child: Text(
                            medicineName,
                            textAlign: TextAlign.center,
                          )),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                            onPressed: () {
                              if (typedName != null) {
                                enteredNamesList.add(typedName);
//              print("Entered NamesList:$enteredNamesList");

                                finalNamesList.clear();
                                for (int i = 0;
                                    i < (textFormFieldCount - 1);
                                    i++) {
                                  finalNamesList.add(enteredNamesList[i]);
                                }
                                print("Final List:$finalNamesList");
                              }
//                              Navigator.pop(context);
                            },
                            child: Text(
                              "Save",
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.blue),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Title:",
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.blue),
                            )),
                      ),
                      Expanded(flex: 4, child: TextFormField()),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Options",
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.blue),
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Options:",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),
                ],
              ),
              content: Container(
                width: 300.0,
                height: 400.0,
                child: ListView.builder(
                  itemCount: textFormFieldCount,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                  size: 24.0,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    onChanged: (enteredText) {
                                      setState(() {
                                        if (enteredText.length == 1) {
                                          if ((index + 1) ==
                                              textFormFieldCount) {
                                            textFormFieldCount = index + 2;
                                          } else {}
                                        } else {
                                          typedName = enteredText;
//                                  print("TypedName:$typedName");
                                        }

                                        if (typedName != null) {
//                                  enteredNamesList.add(typedName);

                                          enteredNamesList.insert(
                                              index, typedName);
                                          enteredNamesList.removeAt(index + 1);
                                        }
                                      });
                                    },
                                    style: TextStyle(color: Colors.red),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
//                          hintText: 'you@example.com',
                                      hintStyle: TextStyle(
                                          fontSize: 30, color: Colors.red),
//                            labelText: 'One',
                                      labelStyle: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Icon(
                            Icons.reorder,
                            color: Colors.grey,
                            size: 24.0,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
//              actions: <Widget>[
//                new FlatButton(
//                  child: new Text('CANCEL'),
//                  onPressed: () {
//                    Navigator.of(context).pop();
//                  },
//                )
//              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView in AlertDialog'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert Dialog'),
          color: Colors.red,
          onPressed: () => _displayDialog(context, "Dolo 650"),
        ),
      ),
    );
  }
}
