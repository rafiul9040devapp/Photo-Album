import 'package:flutter/material.dart';
import 'package:photo_album/model/photo.dart';

class PhotoDetailsPage extends StatelessWidget {
  final Photo photo;

  const PhotoDetailsPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            photo.url ?? '',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .35,
            width: MediaQuery.sizeOf(context).width,
            child: Card(
              color: Colors.white,
              elevation: 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    photo.title ?? 'N/A',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    foregroundColor: Colors.white,
                    child: Text(photo.id.toString()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
