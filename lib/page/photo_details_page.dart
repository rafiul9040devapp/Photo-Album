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
        backgroundColor: Colors.blueAccent.shade200,
        foregroundColor: Colors.white,
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
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .30,
              width: MediaQuery.sizeOf(context).width,
              child: Card(
                color: Colors.grey.shade100,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                        child: Text(
                          photo.title ?? 'N/A',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.black38,
                          foregroundColor: Colors.white,
                          child: Text(photo.id.toString()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
