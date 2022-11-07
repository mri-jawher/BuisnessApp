import 'package:flutter/material.dart';
class notificationPage extends StatelessWidget {
  const notificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _noNotification();
  }
}


Widget _noNotification(){
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('images/notification.png'),Text('No notification yet !',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 25,inherit: false),)],
      )
  );
}