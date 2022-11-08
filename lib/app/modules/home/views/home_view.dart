import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Buddy'),
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: () {},
          child: Container(child: const Icon(Icons.arrow_back)),
        ),
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              if (controller.addedIndex.isNotEmpty) controller.undoFriend();
            },
            child: Container(child: const Icon(Icons.undo)),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {},
            child: Container(child: const Icon(Icons.menu)),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
              height: 400,
              decoration: BoxDecoration(
                  color: globalColors().tPrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)))),
          Obx(() => controller.details.isEmpty
              ? Container()
              : Center(
                  child: Container(
                    width: screenWidth * .8,
                    child: ListView.builder(
                        itemCount: controller.details.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = controller.details[index];
                          return Stack(
                            children: [
                              Container(
                                height: 560,
                              ),
                              Container(
                                height: 300,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(100),
                                        bottomRight: Radius.circular(100))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 280,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  width: screenWidth * .8,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6,
                                            offset: Offset(0.0, 1.0),
                                            color: Color(0x26000000))
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "${data['name']} , ${data['age']}",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "${data['distance']} km",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      GridView(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                childAspectRatio: 2),
                                        shrinkWrap: true,
                                        children: List.generate(
                                          data['hobbies'].length,
                                          (i) {
                                            var hobbiesData =
                                                data['hobbies'][i];
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      globalColors().tSecondary,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(20.0),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Text(hobbiesData)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        data['Profile_discription'],
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Looking for',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 9,
                                            child: GridView(
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      childAspectRatio: 2.5),
                                              shrinkWrap: true,
                                              children: List.generate(
                                                data['interest_in'].length,
                                                (j) {
                                                  var interst =
                                                      data['interest_in'][j];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color:
                                                                Colors.black),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(20.0),
                                                        ),
                                                      ),
                                                      child: Center(
                                                          child: Text(interst)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: InkWell(
                                                onTap: () {
                                                  controller.addFriend(
                                                      data, index);
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        color: globalColors()
                                                            .tPrimaryColor),
                                                    child: Icon(
                                                      Icons.person_add,
                                                      color: Colors.white,
                                                    )),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          );
                        }),
                  ),
                )),
        ],
      ),
    );
  }
}

class globalColors {
  var tPrimaryColor = Colors.blue;
  var tSecondary = Colors.yellow;
}
