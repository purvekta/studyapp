/*import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:studyapp/Screens/mycourse/mycourseList/add_data.dart';
import 'package:studyapp/Screens/mycourse/mycourseList/RT_database_util.dart';
import 'package:studyapp/Screens/mycourse/mycourseList/coursemodel.dart';

class RTCourseList extends StatefulWidget {
  @override
  _RTCourseListState createState() => _RTCourseListState();
}

class _RTCourseListState extends State<RTCourseList>
// implements AddUserCallback
{
  bool _anchorToBottom = false;
  RTDataBaseUtil dataBaseUtil;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataBaseUtil = new RTDataBaseUtil();
    dataBaseUtil.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dataBaseUtil.dispose();
  }
// it will show new user icon

// Widget _buildTitle(BuildContext context) {
//       return new InkWell(
//         child: new Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0),
//           child: new Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               new Text(
//                 'Firebase Database',
//                 style: new TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//It will show new user icon
  List<Widget> _buildActions() {
    return <Widget>[
      new IconButton(
        icon: const Icon(
          Icons.group_add,
          color: Colors.white,
        ), // display pop for new entry
        onPressed: () {},
        //onPressed: () => showEditWidget(null, false),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Course List'),
        ),
        body: FirebaseAnimatedList(
            key: new ValueKey<bool>(_anchorToBottom),
            query: dataBaseUtil.getUser(),
            reverse: _anchorToBottom,
            sort: _anchorToBottom
                ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
                : null,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              return new SizeTransition(
                sizeFactor: animation,
                child: showUser(snapshot),
              );
            }));
  }

  Widget showUser(DataSnapshot res) {
    RTCourseListModel rtCourseListModel = RTCourseListModel.fromsnapshot(res);
    var item = new Card(
      child: new Container(
        child: new Center(
          child: new Row(
            children: <Widget>[
              new CircleAvatar(
                radius: 30.0,
                child: new Text(rtCourseListModel.courseName),
              ),
            ],
          ),
        ),
      ),
    );
    return item;
  }

  // showEditWidget(RTCourseListModel rtCourseListModel, bool isEdit) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => new AddUserDialog()
  //         .buildAboutDialog(context,this, isEdit, rtCourseListModel),
  //   );
  // }
  // @Override // Call util method for add user information
  // void addUser(User user) {
  //   setState(() {
  //     databaseUtil.addUser(user);
  //   });
  // }

  // @override // call util method for update old data.
  // void update(User user) {
  //   setState(() {
  //     databaseUtil.updateUser(user);
  //   });
  // }
}
*/
