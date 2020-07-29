import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_google_sign_in_demo/View_Model/sign_in_view_model.dart';
import 'package:flutter_google_sign_in_demo/utils/deviceSize.dart';
import 'package:flutter_google_sign_in_demo/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Splash extends StatefulWidget {
  @override
  VideoState createState() => VideoState();
}

DeviceSize deviceSize;

class VideoState extends State<Splash> with SingleTickerProviderStateMixin{

  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = DeviceSize(
        size: MediaQuery.of(context).size,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        aspectRatio: MediaQuery.of(context).size.aspectRatio);
    return ChangeNotifierProvider<SignInViewModel>(
      builder: (_) => SignInViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
        fit: StackFit.expand,
    children: <Widget>[
    new Column(
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[

    Padding(padding: EdgeInsets.only(bottom: 30.0),child:new Image.asset('assets/powered_by.png',height: 25.0,fit: BoxFit.scaleDown,))

    ],),
    new Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    new Image.asset(
    'assets/devs.jpg',
    width: animation.value * 250,
    height: animation.value * 250,
    ),
    ],
    ),
    ],
    ),
    )
    );
  }
}
