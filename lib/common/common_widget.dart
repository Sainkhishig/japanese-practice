import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showErrorWidget(context, String title, Object? errorObject) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(title),
    ),
    // drawer: const CommonDrawer(),
    body: ListView(shrinkWrap: true, children: [ErrorWidget(errorObject!)]),
  );
}

Widget showEmptyDataWidgetWithAppBar(context, String title) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(title),
    ),
    body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
          Text(
            "Өгөгдөл олдсонгүй",
            style: TextStyle(fontSize: 26),
          )
        ])),
  );
}

Widget showEmptyDataWidget() {
  return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
        Text(
          "Өгөгдөл олдсонгүй",
          style: TextStyle(fontSize: 26),
        )
      ]));
}

showSuccessToastMessage(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Амжилттай " + message),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
    ),
  );
}

showErrorToastMessage(context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Алдаа：" + message),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}
