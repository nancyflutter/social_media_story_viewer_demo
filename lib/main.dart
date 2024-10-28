import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_media_story_viewer_demo/story_example_page.dart';
import 'package:story_view/story_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Story Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final StoryController controller = StoryController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade400.withOpacity(0.3), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: AppBar(
                title: const Text(
                  "Delicious Ghanaian Meals",
                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: StoryView(
                controller: controller,
                storyItems: [
                  StoryItem.text(
                    title: "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
                    backgroundColor: Colors.purple.shade100,
                    roundedTop: true,
                  ),
                  StoryItem.inlineImage(
                    url: "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExeThpenFrZzhzZjFyaWJlaTZvdnh6c2dxbGVjbGdiYTQyYTIxeW8xZyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/WsWuvZCICpsXPoYOM2/giphy.webp",
                    controller: controller,
                    caption: const Text(
                      "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url: "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExZXU2em9reTh2Y29ndWcyNGRzMDhmZXByZnlhdGpnMGU0b3duZTZoaCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/fuJjrm6Cv2onpmpPEK/giphy.webp",
                    controller: controller,
                    caption: const Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                    controller: controller,
                    caption: const Text(
                      "Hektas, sektas and skatad",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      // primary: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.blueGrey),
                    label: const Text(
                      "View More Stories",
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MoreStories()));
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      // primary: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.blueGrey),
                    label: const Text(
                      "StoryExamplePage",
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StoryExamplePage()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  const MoreStories({super.key});

  @override
  State<MoreStories> createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green.shade400.withOpacity(0.3), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: AppBar(
                automaticallyImplyLeading: true,
                iconTheme: const IconThemeData(color: Colors.white),
                actionsIconTheme: const IconThemeData(color: Colors.white),
                title: const Text(
                  "More Stories",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
              ),
            ),
          ),
        ),
      ),
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title: "I guess you'd love to see more of our food. That's great.",
            backgroundColor: Colors.black,
          ),
          StoryItem.text(
            title: "Nice!\n\nTap to continue.",
            backgroundColor: Colors.pink.shade300,
            textStyle: const TextStyle(
              fontFamily: 'Dancing',
              fontSize: 40,
            ),
          ),
          StoryItem.pageImage(
            url: "https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExa291MnVoMWNyOGlzbDYyNWNzcjhjem5hMzhvdDU4cjZkcDR6aXFnZiZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3o6MbrQELrt6NcJm5W/giphy.webp",
            caption: const Text(" The Simpsons"),
            controller: storyController,
          ),
          StoryItem.pageImage(url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif", caption: const Text("Working with gifs"), controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: const Text("Hello, from the other side"),
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExcDVpZTNrZjRwZjJpdWZncW9iY2Uza211djdydHpvYWUyMG1obDVmdSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/EmqPXYGkfshK1qe4Nd/giphy.webp",
            caption: const Text("Hello, from the other side2"),
            controller: storyController,
          ),
          StoryItem.text(
            title: "Craving more? Here's more of our delicious dishes!",
            backgroundColor: Colors.black,
            textStyle: const TextStyle(
              fontSize: 24,
              color: Colors.white70,
            ),
          ),
          StoryItem.pageImage(
            url: "https://media2.giphy.com/media/3o6MbrQELrt6NcJm5W/giphy.webp",
            caption: const Text("The Simpsons enjoying a meal"),
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
            caption: const Text("Fun with gifs!"),
            controller: storyController,
          ),
        ],
        onStoryShow: (storyItem, index) {
          if (kDebugMode) {
            print("Showing a story");
          }
        },
        onComplete: () {
          if (kDebugMode) {
            print("Completed a cycle");
          }
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
