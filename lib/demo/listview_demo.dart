import 'package:flutter/material.dart';
import 'package:nihao_flutter/demo/post_show.dart';
import 'package:nihao_flutter/model/post.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            children: [
              Image.network(posts[index].imageUrl),
              SizedBox(height: 16.0),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 16.0),
            ],
          ),
          Positioned.fill(
              child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.3),
              highlightColor: Colors.white.withOpacity(0.1),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PostShow(post: posts[index])));
              },
            ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
