
import 'package:flutter/material.dart';
import 'package:progress_hud/progress_hud.dart';



class Utils {
  static Widget progressBar() {
    return ProgressHUD(
      backgroundColor: Colors.black54,
      color: Colors.white,
      containerColor:Colors.red,
      borderRadius: 5.0,
      text: 'Please wait',
    );
  }

 /* static showDialogBox(BuildContext context, String title, String content,
      {int type: 0}) {
    // flutter defined function
    showDialog<void>(
      context: context,
      barrierDismissible: type == 1 ? false : true,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            FlatButton(
                child: Text(
                  "Ok",
                  style: TextStyle(fontSize: 18,color: weddingThemeColor),
                ),
                onPressed: () {
                  type == 0 ? Navigator.pop(context) :Navigator.pop(context)  *//*clearData(context)*//*;
                }),
          ],
        );
      },
    );
  }

  static clearData(BuildContext context) {
    SignInViewModel().clearAllModels();
    Navigator.of(context).pop();
    Prefs.setToken('').then((value){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(
          RouteName.USER_LOGIN, (Route<dynamic> route) => false);
    });
  }



  static showSignUpDialogBox(BuildContext context, String title, String content,
      {int type: 0}) {
    // flutter defined function
    showDialog<void>(
      context: context,
      barrierDismissible: type == 1 ? false : true,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            FlatButton(
                child: Text(
                  "Ok",
                  style: TextStyle(fontSize: 18,color: weddingThemeColor),
                ),
                onPressed: () {
                  type == 0 ?  Navigator.pop(context):  Navigator.pop(context *//*clearSignUpData(context*//*);
                }),
          ],
        );
      },
    );
  }

  static clearSignUpData(BuildContext context) {
    SignUpViewModel().clearAllModels();
    Navigator.of(context).pop();
    Prefs.setToken('').then((value){
      Navigator.of(context)
          .pushNamedAndRemoveUntil(
          RouteName.Sign_Up, (Route<dynamic> route) => false);
    });
  }
*/
}