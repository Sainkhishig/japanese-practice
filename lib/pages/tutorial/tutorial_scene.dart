import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flash_card/flash_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:japanese_practise_n5/common/common_function.dart';
import 'package:japanese_practise_n5/pages/tutorial/tutorial_scene_controller.dart';
import 'package:super_rich_text/super_rich_text.dart';

// pyfm061 : キャンセル規定編集
class TutorialScene extends HookConsumerWidget {
  TutorialScene({Key? key}) : super(key: key);
  String language = "english";
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

    if (controller.state.selectedTutorialKey.isNotEmpty) {
      var mainInfo =
          controller.state.lstAllTutorial[controller.state.selectedTutorialKey];
      List points = mainInfo["points"];
      points.forEach((point) {
        lsttableServings.add(phasePoints(context, point));
      });
      lsttableServings.add(phaseExample(context, controller));
      lsttableServings.add(phaseExercise(context, controller));
    }
    String key = controller.state.lstAllTutorial.keys.first;
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 250,
          child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
            dropdownColor: Colors.white,
            hint: const Text("Заах хичээл"),
            isDense: true,
            items: getDropItems(controller.state.lstAllTutorial),
            value: key, //controller.jlptLevel,
            onChanged: (value) {
              // var selectedLevel = int.parse("$value");
              controller.setTutorKey(value.toString());
            },
          )),
        ),
      ),
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
                  Colors.green
                  // Color.fromARGB(255, 5, 54, 101),
                  // Color.fromARGB(255, 239, 96, 227)
                ],
              )),
              // padding: EdgeInsets.all(80),
              // child:
              // Center(
              //     child: Container(
              //   padding: EdgeInsets.all(10),
              //   height: 200,
              //   width: 300,
              //   color: Colors.white, //Color(0xc0ffffff),
              //   child: const Text('Hello',
              //       style: TextStyle(fontSize: 30, color: Colors.black)),
              // )),
            ),
          ),
          Positioned.fill(
              child: FloatingBubbles.alwaysRepeating(
            noOfBubbles: 20,
            sizeFactor: 0.16,
            // seconds, required if use without alwaysRepeating
            // duration: 120,
            opacity: 30,
            paintingStyle: PaintingStyle.fill, //PaintingStyle.stroke
            strokeWidth: 2, // works with stroke
            shape: BubbleShape
                .roundedRectangle, // circle is the default. No need to explicitly mention if its a circle.
            // speed: BubbleSpeed.slow, //slow, normal, fast
            colorsOfBubbles: const [
              Colors.yellow, //.withAlpha(30),
              Colors.black,
              Colors.white,
            ],
          )),
          Center(
              child: Container(
            padding: EdgeInsets.fromLTRB(150, 50, 150, 50),
            // height: 200,
            // width: 300,
            color: Color(0xc0ffffff),
            child: ListTile(
                title: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                // border: Border.all(
                //   color: Colors.black,
                //   width: 1,
                // ),
              ),
              // padding: EdgeInsets.all(250),
              child: PageView(
                controller: pageController,
                children: lsttableServings,
                onPageChanged: (value) {
                  // controller.setSelectedIndex(value);
                },
              ),
            )),
            // const Text('Hello',
            //     style: TextStyle(fontSize: 30, color: Colors.black)),
          ))
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
    if (controller.state.selectedTutorialKey.isEmpty) {
      return const Center(
          child: Text(
        "Жаргалтай өдрийн мэнд",
        style: TextStyle(fontSize: 30, color: Colors.lightBlue),
      ));
    }
    var mainInfo =
        controller.state.lstAllTutorial[controller.state.selectedTutorialKey];
    var phaseInfo = mainInfo["tutorial"];
    language = phaseInfo["type"];
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
          Visibility(
              child: AnimatedOpacity(
            opacity: showOverView ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: TextButton(
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                child: SuperRichText(
                  useGlobalMarkers: false,
                  text: phaseInfo["overview"] ?? "s",
                  othersMarkers: [
                    MarkerText(
                        marker: '*',
                        style: const TextStyle(color: Colors.green)),
                    MarkerText(
                        marker: '"',
                        style: const TextStyle(color: Colors.blue)),
                    // MarkerText(
                    //     marker: '*',
                    //     style: const TextStyle(color: Colors.blue))
                  ],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              onPressed: () {
                // setState(
                //   () {
                //     showAttention = !showAttention;
                //   },
                // );
              },
            ),
          )),
        ],
      ));
    });
  }

  Widget phasePoints(context, Map point) {
    bool showOverView = false;
    bool showAttention = false;
    bool showFormula = false;

    return StatefulBuilder(builder: (context, setState) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            child: Text(point["points"], style: const TextStyle(fontSize: 60)),
            onPressed: () {
              setState(
                () {
                  showOverView = !showOverView;
                },
              );
            },
          ),
          Visibility(
              visible: !showFormula,
              child: AnimatedOpacity(
                opacity: showOverView ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: TextButton(
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 40, top: 50, right: 20),
                    child: SuperRichText(
                      useGlobalMarkers: false,
                      text: point["formula"] ?? "s",
                      othersMarkers: [
                        MarkerText(
                            marker: '*',
                            style: const TextStyle(color: Colors.green)),
                        MarkerText(
                            marker: '"',
                            style: const TextStyle(color: Colors.blue)),
                        // MarkerText(
                        //     marker: '*',
                        //     style: const TextStyle(color: Colors.blue))
                      ],
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    // Text(point["description"],
                    //     textAlign: TextAlign.center,
                    //     style:
                    //         const TextStyle(fontSize: 18, color: Colors.blue)),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        showFormula = !showFormula;
                      },
                    );
                  },
                ),
              )),
          AnimatedOpacity(
            opacity: showFormula ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: TextButton(
              child: Container(
                  padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
                  child: ListTile(
                    title: SuperRichText(
                      useGlobalMarkers: false,
                      text: point["description"] ?? "s",
                      othersMarkers: [
                        MarkerText(
                            marker: '*',
                            style: const TextStyle(color: Colors.green)),
                        MarkerText(
                            marker: '"',
                            style: const TextStyle(color: Colors.blue)),
                        // MarkerText(
                        //     marker: '*',
                        //     style: const TextStyle(color: Colors.blue))
                      ],
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  )),
              onPressed: () {
                setState(
                  () {
                    showAttention = !showAttention;
                  },
                );
              },
            ),
          ),
          AnimatedOpacity(
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            opacity: showAttention ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child: TextButton(
              child: Container(
                  padding: const EdgeInsets.only(left: 40, top: 50, right: 20),
                  child: Text("Анхаар: ${point["note"] ?? ""}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.red))),
              onPressed: () {},
            ),
          ),
        ],
      ));
    });
  }

  Widget phaseExample(context, TutorialSceneController controller) {
    if (controller.state.selectedTutorialKey.isEmpty) return Text("");

    var mainInfo =
        controller.state.lstAllTutorial[controller.state.selectedTutorialKey];
    List examples = mainInfo["examples"];
    Map tutorial = mainInfo["tutorial"];

    return Center(
        child: FlashCard(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width - 100,
            backWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Жишээ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: ListView.builder(
                        itemCount:
                            examples.length, // currentWord.examples.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var example = examples[index];
                          return ListTile(
                            title: TextButton.icon(
                              onPressed: () {
                                speak(example["example"].replaceAll("*", ""),
                                    language: language);
                              },
                              icon: const Icon(Icons.volume_up),
                              label: SuperRichText(
                                useGlobalMarkers: false,
                                text: example["example"],
                                othersMarkers: [
                                  MarkerText(
                                      marker: '*',
                                      style:
                                          const TextStyle(color: Colors.blue)),
                                  MarkerText(
                                      marker: '"',
                                      style:
                                          const TextStyle(color: Colors.blue))
                                ],
                              ),
                            ),
                            subtitle: Text("${example["exampleTr"]}"),
                          );
                        })),
              ],
            ),
            frontWidget: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SuperRichText(
                      useGlobalMarkers: false,
                      text: tutorial["attention"],
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      othersMarkers: [
                        MarkerText(
                            marker: "'",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                        MarkerText(
                            marker: '*',
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold)),
                        MarkerText(
                            marker: '"',
                            style: const TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  // String detectLanguage({required String string}) {
  //   String languageCodes = 'en';

  //   final RegExp english = RegExp(r'^[a-zA-Z]+');

  //   final RegExp japanese = RegExp(r'^[\u3040-\u30FF]+');
  //   if (english.hasMatch(string)) languageCodes = 'en';
  //   if (japanese.hasMatch(string)) languageCodes = 'ja';

  //   return languageCode;
  // }

  Widget phaseExercise(context, TutorialSceneController controller) {
    if (controller.state.selectedTutorialKey.isEmpty) return const Text("data");

    var mainInfo =
        controller.state.lstAllTutorial[controller.state.selectedTutorialKey];

    List exercises = mainInfo["exercises"];

    return Center(
        child: FlashCard(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width - 100,
            backWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Асуулт",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: ListView.builder(
                        itemCount:
                            exercises.length, // currentWord.examples.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var exercise = exercises[index];
                          return ListTile(
                            title: SuperRichText(
                              useGlobalMarkers: false,
                              text: exercise["Question"],
                              othersMarkers: [
                                MarkerText(
                                    marker: '*',
                                    style: const TextStyle(color: Colors.blue))
                              ],
                            ),
                            // subtitle: Text("${exercise["exampleTr"]}"),
                          );
                        })),
              ],
            ),
            frontWidget: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                    child: Text(
                  "Хариу",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: ListView.builder(
                        itemCount:
                            exercises.length, // currentWord.examples.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var example = exercises[index];
                          return ListTile(
                            title: SuperRichText(
                              useGlobalMarkers: false,
                              text: example["Answer"],
                              othersMarkers: [
                                MarkerText(
                                    marker: '*',
                                    style: const TextStyle(color: Colors.blue))
                              ],
                            ),
                          );
                        })),
              ],
            ))));
  }
}
