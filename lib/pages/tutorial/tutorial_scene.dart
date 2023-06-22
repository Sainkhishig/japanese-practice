import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:japanese_practise_n5/pages/tutorial/tutorial_scene_controller.dart';

// pyfm061 : キャンセル規定編集
class TutorialScene extends HookConsumerWidget {
  TutorialScene({Key? key}) : super(key: key);

  List<DropdownMenuItem<String>> getDropItems(Map lstTutorial) {
    List<DropdownMenuItem<String>> lstDropItem = [];
    lstTutorial.forEach((key, value) {
      print("keydropDown:$key");
      print("keydropDownTitle:${value["tutorial"]["title"]}");
      lstDropItem.add(DropdownMenuItem<String>(
          alignment: AlignmentDirectional.center,
          value: "$key",
          child: Text(
            "${value["tutorial"]["title"]}",
            textAlign: TextAlign.center,
          )));
    });
    // for (var item in ) {
    //   lstDropItem.add(DropdownMenuItem<int>(
    //       alignment: AlignmentDirectional.center,
    //       value: item["title"],
    //       child: Text(
    //         "${item["title"]}",
    //         textAlign: TextAlign.center,
    //       )));
    // }
    // for (var i = 1; i <= 5; i++) {}
    return lstDropItem;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tutorialSceneController.notifier);
    controller.setModelListenable(ref);

    PageController pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    final future = useMemoized(() => controller.getAllTutorial());
    final snapshot = useFuture(future, initialData: null);

    if (snapshot.hasError) return ErrorWidget(snapshot.error!);
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    List<Widget> lsttableServings = [];
    lsttableServings.add(phaseMain(context, controller));
    lsttableServings.add(phaseExercise(context, controller));
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              // color: Colors.deepPurple,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.blue
                  // Color.fromARGB(255, 5, 54, 101),
                  // Color.fromARGB(255, 239, 96, 227)
                ],
              )),
              child:
                  // Center(
                  //     child: Container(
                  //   padding: EdgeInsets.all(10),
                  //   height: 200,
                  //   width: 300,
                  //   color: Colors.white, //Color(0xc0ffffff),
                  //   child: const Text('Hello',
                  //       style: TextStyle(fontSize: 30, color: Colors.black)),
                  // )),
                  ListTile(
                      title: Container(
                        width: 250,
                        padding: const EdgeInsets.only(top: 20),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                          dropdownColor: Colors.white,
                          hint: const Text("Заах хичээл"),
                          isDense: true,
                          items: getDropItems(controller.state.lstAllTutorial),
                          value: "-NYVza4wdDK9hBS2X9vI", //controller.jlptLevel,
                          onChanged: (value) {
                            // var selectedLevel = int.parse("$value");
                            controller.setTutorKey(value.toString());
                          },
                        )),
                      ),

                      // : //Expanded(child: FlashCardListItem(flashcards: flashCard)),

                      subtitle: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          // border: Border.all(
                          //   color: Colors.black,
                          //   width: 1,
                          // ),
                        ),
                        padding: EdgeInsets.all(250),
                        child: PageView(
                          controller: pageController,
                          children: lsttableServings,
                          onPageChanged: (value) {
                            // controller.setSelectedIndex(value);
                          },
                        ),
                      )),
            ),
          ),
          Positioned.fill(
              child: FloatingBubbles.alwaysRepeating(
            noOfBubbles: 10,
            sizeFactor: 0.16,
            // seconds, required if use without alwaysRepeating
            // duration: 120,
            opacity: 30,
            paintingStyle: PaintingStyle.fill, //PaintingStyle.stroke
            strokeWidth: 2, // works with stroke
            shape: BubbleShape
                .roundedRectangle, // circle is the default. No need to explicitly mention if its a circle.
            // speed: BubbleSpeed.slow, //slow, normal, fast
            colorsOfBubbles: [
              Colors.yellow.withAlpha(30),
              Colors.blue,
            ],
          )),
          // Center(
          //   child: Container(
          //     padding: EdgeInsets.all(10),
          //     height: 200,
          //     width: 300,
          //     color: Color(0xc0ffffff),
          //     child: const Text('Hello',
          //         style: TextStyle(fontSize: 30, color: Colors.black)
          //     ),
          //   )
          // )
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
                child: Text(lsttableServings.isEmpty
                    ? " 0/0"
                    : " ${controller.state.selectedCardIndex}/${lsttableServings.length}")),
            IconButton(
              padding: const EdgeInsets.only(bottom: 4),
              iconSize: 40,
              disabledColor: Colors.grey,
              color: Colors.white,
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                if (pageController.page!.toInt() + 1 <
                    lsttableServings.length) {
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
            ),
          ],
        ),
      ),
    );
  }

  Widget phaseMain(context, TutorialSceneController controller) {
    bool showOverView = false;
    bool showDescription = false;
    bool showAttention = false;
    bool showFormula = false;
    if (controller.state.selectedTutorialKey.isEmpty) return Text("data");
    var mainInfo =
        controller.state.lstAllTutorial[controller.state.selectedTutorialKey];
    var phaseInfo = mainInfo["tutorial"];
    return StatefulBuilder(builder: (context, setState) {
      // var selectedValues = values ?? [];
      return Center(
          // height: 500,
          // width: 500,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            child: Text(phaseInfo["title"], style: TextStyle(fontSize: 60)),
            onPressed: () {
              setState(
                () {
                  showOverView = !showOverView;
                },
              );
            },
          ),
          AnimatedOpacity(
            opacity: showOverView ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: TextButton(
              child: Text(phaseInfo["overview"],
                  style: const TextStyle(fontSize: 30, color: Colors.blue)),
              onPressed: () {
                setState(
                  () {
                    showFormula = !showFormula;
                  },
                );
              },
            ),
          ),
          AnimatedOpacity(
            opacity: showFormula ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: TextButton(
              child: Text(phaseInfo["formula"] ?? "",
                  style: TextStyle(fontSize: 20, color: Colors.green)),
              onPressed: () {
                setState(
                  () {
                    showAttention = !showAttention;
                  },
                );
              },
            ),
          ),
          // AnimatedOpacity(
          //   // If the widget is visible, animate to 0.0 (invisible).
          //   // If the widget is hidden, animate to 1.0 (fully visible).
          //   opacity: showDescription ? 1.0 : 0.0,
          //   duration: const Duration(milliseconds: 500),
          //   // The green box must be a child of the AnimatedOpacity widget.
          //   child: TextButton(
          //     child: Text(phaseInfo["description"] ?? "",
          //         style: const TextStyle(fontSize: 15, color: Colors.red)),
          //     onPressed: () {
          //       setState(
          //         () {
          //           showAttention = !showAttention;
          //         },
          //       );
          //     },
          //   ),
          // ),
          AnimatedOpacity(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            opacity: showAttention ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: TextButton(
              child: Text(phaseInfo["attention"] ?? "",
                  style: TextStyle(fontSize: 12, color: Colors.red)),
              onPressed: () {},
            ),
          ),
        ],
      ));
      // Column(
      //     children: [
      //       AnimatedOpacity(
      //         // If the widget is visible, animate to 0.0 (invisible).
      //         // If the widget is hidden, animate to 1.0 (fully visible).
      //         opacity: visibleHello ? 1.0 : 0.0,
      //         duration: const Duration(milliseconds: 500),
      //         // The green box must be a child of the AnimatedOpacity widget.
      //         child: Container(
      //           width: 200.0,
      //           height: 200.0,
      //           child: Text("hello"),
      //         ),
      //       ),
      //       IconButton(
      //         icon: Icon(
      //           Icons.add_box,
      //           color: LightTheme.primary,
      //           size: 30,
      //         ),
      //         tooltip: 'add action',
      //         onPressed: () {
      //           setState(
      //             () {
      //               visibleHello = !visibleHello;
      //             },
      //           );
      //         },
      //       ),
      //     ],
      //   );
    });
  }

  Widget phaseExample(context, TutorialSceneController controller) {
    return Center(
        child: Column(
      children: const [
        Text("example"),
        Text("exampleTR"),
        Text("description"),
        Text("attention"),
      ],
    ));
  }

  Widget phaseExercise(context, TutorialSceneController controller) {
    if (controller.state.selectedTutorialKey.isEmpty) return Text("data");
    return Center(
        child: FlashCard(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width - 100,
            frontWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("currentWord.translate"),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    itemCount: 3, // currentWord.examples.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      // ExampleHive example = currentWord.examples[index];
                      return ListTile(
                        title: Text("example.example"),
                        subtitle: Text("example.translate"),
                      );
                    }),
              ],
            ),
            backWidget: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                    child: Text(
                  "hello exercise",
                  // currentWord.word.isNotEmpty
                  //     ? currentWord.word
                  //     : currentWord.translate,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
                // Visibility(
                //   visible: controller.isShowPreference ?? true,
                //   child: IconButton(
                //     onPressed: () {
                //       // if (currentWord.word.isNotEmpty) {
                //       //   speak(currentWord.word);
                //       // } else {
                //       //   speak(currentWord.word);
                //       // }
                //     },
                //     iconSize: 50,
                //     icon: const Icon(Icons.volume_up),
                //   ),
                // )
              ],
            ))));
  }
}
