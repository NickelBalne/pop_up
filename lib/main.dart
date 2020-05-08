import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
    TextEditingController txt = new TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          var enteredNamesList = [];
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Column(
                mainAxisSize: MainAxisSize.max,
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
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17.0
                            ),
                          )
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          medicineName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Save",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 17.0
                            ),
                          )
                        ),
                      ),
//                       Expanded(
//                         flex: 1,
//                         child: FlatButton(
//                             onPressed: () {
//                               if (typedName != null) {  
//                                 enteredNamesList.add(typedName);
// //              print("Entered NamesList:$enteredNamesList");

//                                 finalNamesList.clear();
//                                 for (int i = 0;
//                                     i < (textFormFieldCount - 1);
//                                     i++) {
//                                   finalNamesList.add(enteredNamesList[i]);
//                                 }
//                                 print("Final List:$finalNamesList");
//                               }
// //                              Navigator.pop(context);
//                             },
//                             child: Text(
//                               "Save",
//                               textAlign: TextAlign.right,
//                               style: TextStyle(color: Colors.blue),
//                             )),
//                       ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: FlatButton(
                          onPressed: () {
                          },
                          child: Text(
                            "Title:",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0
                            ),
                          )
                        ),
                      ),
                      Expanded(
                        flex: 4, 
                        child: TextFormField(
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Title',
                          )
                        )
                      ),
                      // Expanded(
                      //   flex: 1,
                      //   child: FlatButton(
                      //       onPressed: () {
                      //         Navigator.pop(context);
                      //       },
                      //       child: Text(
                      //         "Options",
                      //         textAlign: TextAlign.right,
                      //         style: TextStyle(color: Colors.blue),
                      //       )
                      //     ),
                      // ),
                      Expanded(
                        flex: 1,
                        child: RaisedButton(
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            side: BorderSide(color: Colors.grey[400])
                          ),
                          child: Text('Options',
                            style: new TextStyle(
                              color: Colors.black
                            ),
                          ),
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[400],
                  ),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                        },
                        child: Text(
                          "Options:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0
                          ),
                        )
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            controller: txt,
                            style: TextStyle(color: Colors.red),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(fontSize: 15, color: Colors.red),
                              labelStyle: TextStyle(
                                color: Colors.red,
                              ),
                              // suffixIcon: new GestureDetector(
                              //   onTap: () {
                              //     setState(() {
                              //       print(txt.text.toString());
                              //     });
                              //   },
                              //   child: new Icon(Icons.done),
                              // )
                            ),
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(left:15.0),
                        child: GestureDetector(
                          onTap: (){
                            setState((){
                              enteredNamesList.add(txt.text.toString());
                              txt.clear();
                            });
                          },
                          child: new CircleAvatar(
                            backgroundColor: Colors.lightBlue,
                            radius: 10.0,
                            child: new Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15.0,
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              content: 
              enteredNamesList.length == 0 ?
              new Container(height: 1.0):
              new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 500.0,
                    height: 220.0,
                    child: 
                    ReorderableListView(
                      children: List.generate(
                        enteredNamesList.length,(index) =>
                        ListTile(
                          key: Key("${index.toString()}"),
                          title:  Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            child: new Container(
                              height: 40.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                      size: 24.0,
                                    ),
                                  ),
                                  new Text(enteredNamesList[index].toString(),
                                    style: new TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: IconButton(
                                          onPressed: (){
                                            setState((){
                                              txt.text = enteredNamesList[index];
                                              enteredNamesList.removeAt(index);
                                            });
                                          },
                                          icon: Icon(Icons.edit),
                                          color: Colors.grey,
                                          iconSize: 24.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Icon(
                                          Icons.reorder,
                                          color: Colors.grey,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: 'Delete',
                                foregroundColor: Colors.white,
                                color: Colors.red,
                                iconWidget: Icon(Icons.delete,color: Colors.white,),
                                onTap: () {
                                  setState((){
                                    enteredNamesList.removeAt(index);
                                  });
                                }
                              ),
                            ],
                          ),
                        )
                      ),
                      onReorder: (int start, int current) {
                        // dragging from top to bottom
                        if (start < current) {
                          int end = current - 1;
                          String startItem = enteredNamesList[start];
                          int i = 0;
                          int local = start;
                          do {
                            enteredNamesList[local] = enteredNamesList[++local];
                            i++;
                          } while (i < end - start);
                          enteredNamesList[end] = startItem;
                        }
                        // dragging from bottom to top
                        else if (start > current) {
                          String startItem = enteredNamesList[start];
                          for (int i = start; i > current; i--) {
                            enteredNamesList[i] = enteredNamesList[i - 1];
                          }
                          enteredNamesList[current] = startItem;
                        }
                        setState(() {});
                      },
                    ),
                  )
                ],
              ),
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
          child: Text('Show Alert Dialog',
            style: new TextStyle(
              color: Colors.white
            ),
          ),
          color: Colors.red,
          onPressed: () => _displayDialog(context, "Dolo 650"),
        ),
      ),
    );
  }
}
