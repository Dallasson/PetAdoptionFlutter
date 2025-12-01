import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/app_router.dart';
import 'package:pet/storage_helper.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  bool isButtonVisible = false;
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final List<String> _titles = [
    "Find Your New Best Friend",
    "Adopt, Don’t Shop",
    "Give a Pet a Loving Home"
  ];

  final List<String> _images = [
    "assets/images/logo.png",
    "assets/images/logo.png",
    "assets/images/logo.png"
  ];

  final List<String> _descriptions = [
    "Browse hundreds of adorable dogs and cats waiting for a caring family. Your perfect companion is just a tap away!",
    "Millions of pets are looking for a safe, warm home. By adopting, you give a second chance to animals in need.",
    "Save your favorite pets, book visits, and start your journey to becoming a proud pet parent today."
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
               Expanded(
                 flex: 1,
                 child: PageView(
                   onPageChanged: (int index){
                     setState(() {
                       _currentIndex = index;

                       if(_currentIndex == 2){
                          isButtonVisible = true;
                       } else {
                          isButtonVisible = false;
                       }
                     });
                   },
                   controller: _pageController,
                   children: List.generate(_titles.length, (int index){
                     return Column(
                       spacing: 100,
                       children: [
                         Text(_titles[index],style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                         Image.asset(_images[index],height: 300,width: 300,fit: BoxFit.cover,filterQuality: FilterQuality.high,),
                         Text(_descriptions[index],style: TextStyle(fontWeight: FontWeight.w800,fontSize: 17,),
                         textAlign: TextAlign.center,)
                       ],
                     );
                   }),
                 ),
               ),
               Column(
                 spacing: 60,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: List.generate(_titles.length, (int index){
                       return Container(
                         width: _currentIndex == index ? 15 : 10,
                         height: _currentIndex == index ? 15 : 10,
                         margin: const EdgeInsets.only(left: 5),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(60),
                             color: _currentIndex == index ? Colors.black : Colors.black54
                         ),
                       );
                     }),
                   ),
                   Visibility(
                     visible: isButtonVisible,
                     child: GestureDetector(
                       onTap: (){
                         StorageHelper.setStatus();
                           Get.offAndToNamed(AppRouter.loginScreen);
                       },
                       child: Container(
                         width: 200,
                         height: 50,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                             color: Colors.black87
                         ),
                         child: Center(
                           child: Text("Get Started",style: TextStyle(fontWeight: FontWeight.w700,
                           color: Colors.white),),
                         ),
                       ),
                     ),
                   )
                 ],
               )
            ],
          ),
        ),
      ),
    );
  }
}
