import 'package:flutter/material.dart';
import 'package:nihao_flutter/model/post.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 向上滚动时SliverAppBar会一起滚动，并有渐进效果
          SliverAppBar(
            // title: Text('NIHAO'),
            // pinned: true, 不跟随滚动
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'NIHAO FLUTTER'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                  'http://resources.ninghao.net/images/overkill.png',
                  fit: BoxFit.cover),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
              // sliver: SliverGridDemo(),
            ),
          )
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        // builder
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        // childAspectRatio: 1.2,
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  const SliverListDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        // builder
        (BuildContext context, int index) {
          // 加内边距
          return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            // 加圆角效果
            child: Material(
              // 如果不设置Clip.antiAlias，圆角效果不起作用
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(8.0),
              elevation: 9.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(posts[index].title,
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Text(posts[index].author,
                            style:
                                TextStyle(fontSize: 13, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
