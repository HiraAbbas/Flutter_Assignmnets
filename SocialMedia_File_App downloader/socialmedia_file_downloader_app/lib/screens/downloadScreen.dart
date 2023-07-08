import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Downloadscreen extends StatefulWidget {
  const Downloadscreen({Key? key}) : super(key: key);

  @override
  State<Downloadscreen> createState() => DownloadscreenState();
}

class DownloadscreenState extends State<Downloadscreen> {
  //final TextEditingController _urlController = TextEditingController();
  //int _currentIndex = 0;
  List<XFile>? galleryImages;
  List<XFile>? galleryVideos;
  VideoPlayerController? videoPlayerController;

  Future<void> selectImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? selectedImages =
        await _picker.pickMultiImage(imageQuality: 80);
    setState(() {
      galleryImages = selectedImages;
    });
  }

  Future<void> selectVideos() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? selectedVideo = await _picker.pickVideo(source: ImageSource.gallery);
    if (selectedVideo != null) {
      videoPlayerController = VideoPlayerController.file(File(selectedVideo.path));
      await videoPlayerController!.initialize();
    }
    setState(() {
      galleryVideos = selectedVideo != null ? [selectedVideo] : null;
    });
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        backgroundColor: Colors.white,
        title: const Text(
          "Social Downloader",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_sharp, color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Images'),
                  Tab(text: 'Videos'),
                ],
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.blue,
                labelColor: Colors.black,
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    if (galleryImages != null)
                      ListView.builder(
                        itemCount: galleryImages!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.file(
                              File(galleryImages![index].path),
                              width: 50,
                              height: 50,
                            ),
                            title: Text('Image ${index + 1}'),
                            onTap: () {
                              // Handle image tap
                            },
                          );
                        },
                      )
                    else
                      Center(child: Text('No images selected')),
                    if (galleryVideos != null)
                      ListView.builder(
                        itemCount: galleryVideos!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: FutureBuilder(
                              future: videoPlayerController!.initialize(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  return AspectRatio(
                                    aspectRatio: videoPlayerController!.value.aspectRatio,
                                    child: VideoPlayer(videoPlayerController!),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                            title: Text('Video ${index + 1}'),
                            onTap: () {
                              // Handle video tap
                            },
                          );
                        },
                      )
                    else
                      Center(child: Text('No videos selected')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await selectImages();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
