import 'package:chats/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  SearchView({super.key});

  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.red[900],
          title: const Text('Search'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                onChanged: (value) => controller.searchFriend(
                  value,
                  authC.user.value.email!,
                ),
                controller: controller.searchC,
                cursorColor: Colors.red[900],
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  hintText: "Search new friend here..",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  suffixIcon: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.red[900],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 1,
        itemBuilder: (context, index) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black26,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/logo/noimage.png",
                  fit: BoxFit.cover,
                )),
          ),
          title: const Text(
            "ام محمد",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text(
            "hananabood1972@gmail.com",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: GestureDetector(
            onTap: () => authC.addNewConnection(
              'hananabood1972@gmail.com',
            ),
            child: const Chip(
              label: Text("Message"),
            ),
          ),
        ),
      ),
    );
  }
}
