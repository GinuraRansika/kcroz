import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../utils/utils.dart';

class AdditionalStep extends StatefulWidget {
  const AdditionalStep({Key? key}) : super(key: key);


  @override
  State<AdditionalStep> createState() => _AdditionalStepState();
}

class _AdditionalStepState extends State<AdditionalStep> {
  final List<Uint8List> _imageList = [];

  void selectImageToFeed(int imageNumber) async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      if(_imageList.isEmpty){
        _imageList.add(image);
      }
      _imageList[imageNumber] = image;
    });
  }

  Widget getImage(double width) {
    if(_imageList.length == 0){
      return Image(
          width: width * 0.45,
          height: 220,
          fit: BoxFit.cover,
          image: AssetImage(kcrozDefaultProfileImage)
      );
    } else{
      return Image(
          width: width * 0.45,
          height: 220,
          fit: BoxFit.cover,
          image: AssetImage(kcrozOnBoardingImage1)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Center(
          child: Column(
              children: [
                SizedBox(height: 50,),
                Text("Add More Photos",style: Theme.of(context).textTheme.headline1,),
                SizedBox(height: 50,),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: _imageList.isEmpty? Image(
                                      width: width * 0.45,
                                      height: 320,
                                      fit: BoxFit.cover,
                                      image: AssetImage(kcrozOnBoardingImage1)
                                  ):
                                  Image(
                                      width: width * 0.45,
                                      height: 320,
                                      fit: BoxFit.cover,
                                      image: MemoryImage(_imageList[0])
                                  )                                                  ,
                                ),
                              ),
                              Positioned(
                                  bottom: -10,
                                  left: width * 0.38,
                                  child: IconButton(
                                    onPressed: () {
                                      selectImageToFeed(0);
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outlined,
                                      size: 30,
                                    ),
                                  )),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: getImage(width)
                                ),
                              ),
                              Positioned(
                                  bottom: -10,
                                  left: width * 0.38,
                                  child: IconButton(
                                    onPressed: () {
                                      selectImageToFeed(3);
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outlined,
                                      size: 30,
                                    ),
                                  )),
                            ],
                          ),
                        ],),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: Image(
                                      width: width * 0.45,
                                      height: 220,
                                      fit: BoxFit.cover,
                                      image: AssetImage(kcrozOnBoardingImage1)
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: -10,
                                  left: width * 0.38,
                                  child: IconButton(
                                    onPressed: () {
                                      selectImageToFeed(2);
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outlined,
                                      size: 30,
                                    ),
                                  )),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: Image(
                                      width: width * 0.45,
                                      height: 320,
                                      fit: BoxFit.cover,
                                      image: AssetImage(kcrozOnBoardingImage1)
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: -10,
                                  left: width * 0.38,
                                  child: IconButton(
                                    onPressed: () {
                                      selectImageToFeed(4);
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outlined,
                                      size: 30,
                                    ),
                                  )),
                            ],
                          ),
                        ],)
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Back"),
                          )
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text("Next"),
                          )
                      ),
                    ],

                  ),
                )
              ]
          ),
        ),
      ),
    );;
  }
}
