import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<Widget> likedImages = [];

  @override
  Widget build(BuildContext context) {
    /*just image view*/
    // return GridView.count(
    //   scrollDirection: Axis.vertical,
    //   crossAxisCount: 3,
    //   mainAxisSpacing: 5.0,
    //   crossAxisSpacing: 5.0,
    //   padding: const EdgeInsets.all(5.0),
    //   children: createImageButton(20, context),
    // );

    /*image view + liked images*/
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 3,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            padding: const EdgeInsets.all(5.0),
            children: createImageButton(20, context),
          ),
        ),
        const Divider(height: 32.0),
        const Text(
          'Liked Images',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 3,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              padding: const EdgeInsets.all(5.0),
              children: likedImages,
            )
        ),
      ],
    );
  }

  List<Widget> createImageButton(int imgNum, BuildContext context) {
    List<Widget> images = [];
    List<String> urls = [];
    urls.add('images/1.jpeg');
    urls.add('images/2.jpeg');
    urls.add('images/3.jpeg');
    urls.add('images/4.jpeg');
    urls.add('images/5.jpeg');
    urls.add('images/6.jpeg');
    urls.add('images/7.jpeg');
    urls.add('images/8.jpeg');
    urls.add('images/9.jpeg');
    urls.add('images/10.jpeg');
    urls.add('images/11.jpeg');
    urls.add('images/12.jpeg');
    urls.add('images/13.jpeg');
    urls.add('images/14.jpeg');
    urls.add('images/15.jpeg');
    urls.add('images/16.jpeg');
    urls.add('images/17.jpeg');
    urls.add('images/18.jpeg');
    urls.add('images/19.jpeg');
    urls.add('images/20.jpeg');

    void showImageDetails(BuildContext context, int index) async {
        String? url = await Navigator.push<String>(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailsScreen(imageIndex: index),
          ),
        );
        addToLikedImages(url!);
    }

    for (int i = 0; i < imgNum; i++) {
      images.add(
        GestureDetector(
          onTap: () {
            showImageDetails(context, i);
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(urls[i]),
              ),
            ),
          ),
        ),
      );
    }
    return images;
  }

  void addToLikedImages(String url){
    setState((){
      likedImages.add(
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(url),
            ),
          ),
        ),
      );
    });
  }
}

class ImageDetailsScreen extends StatefulWidget {
  final int imageIndex;

  const ImageDetailsScreen({super.key, required this.imageIndex});

  @override
  State<ImageDetailsScreen> createState() => _ImageDetailsScreenState();
}

class _ImageDetailsScreenState extends State<ImageDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Image Details'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: [
            Image.asset(
              'images/${widget.imageIndex + 1}.jpeg',
            ),
            _buildItem('Image Name', '${widget.imageIndex + 1}.jpeg'),
            const Divider(height: 32.0),
            _buildButton('Like', 'images/${widget.imageIndex + 1}.jpeg', context)
          ]
        ),
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
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16.0),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String type, String url, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: (){
            // _GalleryScreenState().addToLikedImages(url, context);
            Navigator.pop(context, url);
          },
          child: Text(type),
        ),
      ],
    );
  }
}

