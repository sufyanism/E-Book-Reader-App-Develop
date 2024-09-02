import 'package:flutter/material.dart';
import 'package:zeba_books/featured/custom_widgets/category.dart';
import 'package:zeba_books/featured/custom_widgets/selection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<IconData> navIcons = [
    Icons.window_rounded,
    Icons.search,
    Icons.bookmark_border,
    Icons.person_3_outlined,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage("https://www.gstatic.com/webp/gallery/1.webp"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black,
              ),
              child: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 236, 236, 224),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Hey,\t",
                          style: TextStyle(color: Colors.black, fontSize: 24),
                        ),
                        TextSpan(
                          text: "Steve!",
                          style: TextStyle(color: Colors.red, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 3),
                  const Text(
                    'What will you listen today?',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CategoryButton(label: 'All', isSelected: true),
                        CategoryButton(label: 'Detective'),
                        CategoryButton(label: 'Drama'),
                        CategoryButton(label: 'Historical'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SectionTitle(title: 'Drama'),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 310,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                image: NetworkImage(
                                    "https://www.gstatic.com/webp/gallery/1.webp"),
                                fit: BoxFit.cover,
                                height: 250,
                                width: 180,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Moby Dick",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Hermen Meville",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (_, i) {
                        return const SizedBox(width: 20);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  const SectionTitle(title: 'Detective'),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 310,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: const Image(
                                image: NetworkImage(
                                    "https://www.gstatic.com/webp/gallery/1.webp"),
                                fit: BoxFit.cover,
                                height: 250,
                                width: 180,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Moby Dick",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Hermen Meville",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (_, i) {
                        return const SizedBox(width: 20);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(bottom: 5, child: navBar()),
        ],
      ),
    );
  }

  Widget navBar() {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: navIcons.map((icon) {
          int   index = navIcons.indexOf(icon);
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: (){
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 33.5),
              child: Icon(icon ,color: isSelected ? Colors.red : Colors.white ,),
            ),
          );
        }).toList(),
      ),
    );
  }
}
