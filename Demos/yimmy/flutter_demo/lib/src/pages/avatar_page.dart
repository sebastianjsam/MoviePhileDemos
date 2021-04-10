import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9Ib6jxaMkCKXs6hLx2WW8P_vH0l8tsth4Na876Fu9DYueRtvhCeFUTXv9T2UrHBSE5TY&usqp=CAU'),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
              child: Text('Login'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
          child: Container(
        child: Text('Registre sus datos..'),
      )),
    );
  }
}
