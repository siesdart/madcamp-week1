import 'package:flutter/material.dart';

class GalleryDetailScreen extends StatelessWidget {
  final int imageIndex;

  const GalleryDetailScreen({required this.imageIndex, super.key});

  @override
  Widget build(BuildContext context) {
    final imageName = '${imageIndex + 1}.jpeg';

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            // background blue container
            top: 0,
            right: 0,
            left: 0,
            bottom: MediaQuery.of(context).size.height * 0.60,
            // background blue container
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120.0),
                ),
                color: Colors.blueAccent,
              ),
            ),
          ),
          Positioned(
            // 2nd background container
            top: 450,
            right: 0,
            left: 0,
            bottom: 0,
            // background blue container
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100.0),
                ),
                color: Colors.blueAccent,
              ),
            ),
          ),
          Positioned(
            // image detail pop-up screen
            top: 15.0,
            left: 20.0,
            right: 20.0,
            bottom: 15.0,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              appBar: EmptyAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(38.0),
                            color: Colors.white,
                            //border: Border.all(color: Colors.blueGrey, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.7),
                                blurRadius: 5.0,
                                spreadRadius: 0.0,
                                offset: const Offset(0, 3),
                              )
                            ]
                        ),
                        child: (SingleChildScrollView(
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                    Icons.close,
                                    size: 30,
                                ),
                              ),
                              Image.asset('images/$imageName'),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    _buildItem('Image Name', imageName),
                                    const Divider(height: 32),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context, imageIndex);
                                      },
                                      child: const Text('Like'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                        )
                    ),
                  ],
                ),
              )
            )
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String type, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type.toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(0.0, 0.0);

}

