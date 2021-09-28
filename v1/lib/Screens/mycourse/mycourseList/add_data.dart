import 'package:flutter/material.dart';
//import 'package:studyapp/Screens/mycourse/mycourseList/RT_database_util.dart';
import 'package:studyapp/Screens/mycourse/mycourseList/coursemodel.dart';
import 'coursemodel.dart';

class AddUserDialog {
  final teName = TextEditingController();
  final teEmail = TextEditingController();
  final teAge = TextEditingController();
  final teMobile = TextEditingController();
  RTCourseListModel rtCourseListModel;
  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );
  Widget buildAboutDialog(
      BuildContext context,
      AddUserCallback _myHomePageState,
      bool isEdit,
      RTCourseListModel rtCourseListModel) {
    if (rtCourseListModel != null) {
      this.rtCourseListModel = rtCourseListModel;
      teName.text = rtCourseListModel.courseImg;
      teEmail.text = rtCourseListModel.courseName;
      teAge.text = rtCourseListModel.courseid;
      teMobile.text = rtCourseListModel.id;
    }
    return new AlertDialog(
      title: new Text(isEdit ? 'Edit detail!' : 'Add new user!'),
      content: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getTextField("Name", teName),
            getTextField("Email", teEmail),
            getTextField("Age", teAge),
            getTextField("Mobile", teMobile),
            new GestureDetector(
              onTap: () => onTap(isEdit, _myHomePageState, context),
              child: new Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: getAppBorderButton(isEdit ? "Edit" : "Add",
                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getTextField(
      String inputBoxName, TextEditingController inputBoxController) {
    var loginBtn = new Padding(
      padding: const EdgeInsets.all(5.0),
      child: new TextFormField(
        controller: inputBoxController,
        decoration: new InputDecoration(
          hintText: inputBoxName,
        ),
      ),
    );

    return loginBtn;
  }

  RTCourseListModel getData(bool isEdit) {
    return new RTCourseListModel(
        isEdit ? 'rtCourseListModel._id' : "",
        teName.text,
        teEmail.text,
        teAge.text,
        teMobile.text,
        'rtCourseListMode.uid');
  }

  onTap(bool isEdit, AddUserCallback _myHomePageState, BuildContext context) {
    if (isEdit) {
      _myHomePageState.update(getData(isEdit));
    } else {
      _myHomePageState.addUser(getData(isEdit));
    }

    Navigator.of(context).pop();
  }
}

Widget getAppBorderButton(String buttonLabel, EdgeInsets margin) {
  var loginBtn = new Container(
    margin: margin,
    padding: EdgeInsets.all(8.0),
    alignment: FractionalOffset.center,
    decoration: new BoxDecoration(
      border: Border.all(color: const Color(0xFF28324E)),
      borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
    ),
    child: new Text(
      buttonLabel,
      style: new TextStyle(
        color: const Color(0xFF28324E),
        fontSize: 20.0,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.3,
      ),
    ),
  );
  return loginBtn;
}

//Call back of user dashboad
abstract class AddUserCallback {
  void addUser(RTCourseListModel rtCourseListModel);

  void update(RTCourseListModel rtCourseListModel);
}
