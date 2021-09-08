import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "http://bp3.blogger.com/_2CnQWIZQ3NY/R1OivOLCtZI/AAAAAAAAAV8/yuYFUa2QB-U/s1600-R/cypr.jpg"),
              radius: 22,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              child: Text("CH"),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage(
                "https://i.ytimg.com/vi/ar7Vy53CNF4/maxresdefault.jpg"),
            fadeInDuration: Duration(milliseconds: 200),
            ),
      ),
    );
  }
}
