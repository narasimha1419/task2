import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  RxList addedFriends = [].obs;
  RxList addedIndex = [].obs;
  RxList details = [
    {
      'id': 1,
      'name': 'narasimha',
      'age': 21,
      'distance': 0.65,
      'hobbies': ['Blogging', 'Photography', 'Cricket'],
      'Profile_discription':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy',
      'interest_in': ['friends', 'coffe'],
      'image':
          "https://res.cloudinary.com/fleetnation/image/private/c_fit,w_1120/g_south,l_text:style_gothic2:%C2%A9%20Anne%20Burke,o_20,y_10/g_center,l_watermark4,o_25,y_50/v1555979825/pbdygo4fy2hwpboi3gdi.jpg"
    },
    {
      'id': 2,
      'name': 'divya',
      'age': 25,
      'distance': 0.65,
      'hobbies': ['Traveling', 'Cricket'],
      'Profile_discription':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy',
      'interest_in': ['Team', 'coffe'],
      'image':
          "https://res.cloudinary.com/fleetnation/image/private/c_fit,w_1120/g_south,l_text:style_gothic2:%C2%A9%20Anne%20Burke,o_20,y_10/g_center,l_watermark4,o_25,y_50/v1555979825/pbdygo4fy2hwpboi3gdi.jpg"
    },
    {
      'id': 3,
      'name': 'pavan',
      'age': 30,
      'distance': 0.65,
      'hobbies': ['tv', 'Photography'],
      'Profile_discription':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy',
      'interest_in': ['Team', 'friends', 'coffe'],
      'image':
          "https://res.cloudinary.com/fleetnation/image/private/c_fit,w_1120/g_south,l_text:style_gothic2:%C2%A9%20Anne%20Burke,o_20,y_10/g_center,l_watermark4,o_25,y_50/v1555979825/pbdygo4fy2hwpboi3gdi.jpg"
    },
    {
      'id': 4,
      'name': 'geta',
      'age': 20,
      'distance': 0.65,
      'hobbies': ['Blogging', 'Cricket'],
      'Profile_discription':
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy',
      'interest_in': ['Team', 'friends'],
      'image':
          "https://res.cloudinary.com/fleetnation/image/private/c_fit,w_1120/g_south,l_text:style_gothic2:%C2%A9%20Anne%20Burke,o_20,y_10/g_center,l_watermark4,o_25,y_50/v1555979825/pbdygo4fy2hwpboi3gdi.jpg"
    }
  ].obs;

  addFriend(data, index) {
    addedFriends.add(data);
    details.removeAt(index);
    addedIndex.add(index);
  }

  undoFriend() {
    addedIndex.length - 1;

    details.insert(addedIndex[addedIndex.length - 1], addedFriends.last);
    addedFriends.removeLast();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
