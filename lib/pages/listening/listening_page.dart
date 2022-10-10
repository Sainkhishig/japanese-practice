// https://suragch.medium.com/background-audio-in-flutter-with-audio-service-and-just-audio-3cce17b4a7d
import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:japanese_practise_n5/common/player/sample/player_page.dart';

import 'package:japanese_practise_n5/common/search_bar.dart';
import 'package:japanese_practise_n5/pages/listening/listening_model.dart';
import 'package:translit/translit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'listening_page_controller.dart';

class ListeningPage extends HookConsumerWidget {
  ListeningPage({Key? key}) : super(key: key);

  final trans = Translit();

  final keywordController = useTextEditingController();
  // AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );

    final controller = ref.watch(grammerPageProvider.notifier);
    controller.setModelListenable(ref);

    return Scaffold(
      body: //Expanded(child: FlashCardListItem(flashcards: flashCard)),
          Column(
        children: [
          AudioControlButtons(),
          // PlayerPage(),
          // Center(
          //   child: Player(),
          // ),
          // AudioPlayers(),
          IconButton(
              onPressed: () async {
                final dbinstance = FirebaseDatabase.instance.reference();
                dbinstance.set({'description': 'vanilla latte', 'price': 4.99});
                // String audioasset = "assets/listening/practice/n5_1_1.mp3";
                // ByteData bytes =
                //     await rootBundle.load(audioasset); //load sound from assets
                // Uint8List soundbytes = bytes.buffer
                //     .asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
                // int result = await player.playBytes(soundbytes);
                // if (result == 1) {
                //   //play success
                //   print("Sound playing successful.");
                // } else {
                //   print("Error while playing sound.");
                // }
              },
              icon: Icon(Icons.play_circle_outline)),
          CustomSearchBar(keywordController, onSearch: () {
            controller.setSearchKey(keywordController.text);
          }),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [],
              onPageChanged: (value) {
                controller.setSelectedIndex(value);
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 40,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              padding: const EdgeInsets.only(bottom: 4),
              iconSize: 40,
              disabledColor: Colors.grey,
              color: Colors.white,
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                if (pageController.page!.toInt() > 0) {
                  controller.setSelectedIndex(pageController.page!.toInt() - 1);
                  pageController.animateToPage(pageController.page!.toInt() - 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }
              },
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(controller.state.lstListeningData.isEmpty
                    ? " 0/0"
                    : " ${controller.state.selectedCardIndex}/${controller.state.lstListeningData.length}")),
            IconButton(
              padding: const EdgeInsets.only(bottom: 4),
              iconSize: 40,
              disabledColor: Colors.grey,
              color: Colors.white,
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                if (pageController.page!.toInt() + 1 <
                    controller.state.lstListeningData.length) {
                  controller.setSelectedIndex(pageController.page!.toInt() + 1);
                  pageController.animateToPage(pageController.page!.toInt() + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                } else if (pageController.page!.toInt() != 0) {
                  controller.setSelectedIndex(0);
                  pageController.animateToPage(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget tabCardBody(List<ListeningModel> lst, context, controller) {
    // var currentLetter = lstVoc as List<Dictionary>;
    // var ss =
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: lst.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Expanded(
                              //   flex: 1,
                              //   child: Container(
                              //     alignment: Alignment.center,
                              //     child: Text(
                              //       lst[index].grammar,
                              //     ),
                              //   ),
                              // ),
                              // Expanded(
                              //   flex: 2,
                              //   child: Container(
                              //     alignment: Alignment.center,
                              //     child: Text(
                              //       lst[index].grammarMn,
                              //     ),
                              //   ),
                              // ),
                              // Text(
                            ],
                          ),
                        );
                      }))
            ]));
    // return Card(
    //     child: Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Expanded(
    //         child: Padding(
    //             padding: const EdgeInsets.only(left: 30, right: 30),
    //             child: GridView.builder(
    //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                   // childAspectRatio: 3 / 2,
    //                   crossAxisSpacing: 2,
    //                   mainAxisSpacing: 2,
    //                   crossAxisCount: 1,
    //                   mainAxisExtent: MediaQuery.of(context).size.height / 12,
    //                 ),
    //                 itemCount: lst.length,
    //                 itemBuilder: (BuildContext ctx, index) {
    //                   return Container(
    //                     alignment: Alignment.centerLeft,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(5),
    //                       border: Border.all(
    //                         color: Colors.black,
    //                         width: 1,
    //                       ),
    //                     ),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.start,
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Expanded(
    //                           flex: 1,
    //                           child: Container(
    //                             alignment: Alignment.center,
    //                             child: Text(
    //                               lst[index].grammar,
    //                             ),
    //                           ),
    //                         ),
    //                         Expanded(
    //                           flex: 2,
    //                           child: Container(
    //                             alignment: Alignment.center,
    //                             child: Text(
    //                               lst[index].grammarMn,
    //                             ),
    //                           ),
    //                         ),
    //                         // Text(
    //                       ],
    //                     ),
    //                   );
    //                 })))
    //   ],
    // ));

    // Center(
    //   child: Card(
    //     elevation: 4.0,
    //     child: Column(
    //       children: [
    //         Text(currentLetter.name),
    //         Expanded(
    //             flex: 3,
    //             child: Center(
    //               child: GridView.builder(
    //                 itemCount: currentLetter.lstLetter.length,
    //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 5,
    //                   mainAxisExtent: MediaQuery.of(context).size.height / 12,
    //                 ),
    //                 itemBuilder: (BuildContext context, int index) {
    //                   return Padding(
    //                       padding: const EdgeInsets.all(1),
    //                       child: Row(children: [
    //                         Container(
    //                           decoration: BoxDecoration(
    //                             border: Border.all(
    //                               color: Colors.black,
    //                               width: 2,
    //                             ),
    //                           ),
    //                           child: Text(
    //                             currentLetter.lstLetter[index],
    //                             style: const TextStyle(color: Colors.black),
    //                           ),
    //                         )
    //                       ]));
    //                 },
    //               ),
    //             )),
    //       ],
    //     ),
    //   ),
    // );
  }
}
