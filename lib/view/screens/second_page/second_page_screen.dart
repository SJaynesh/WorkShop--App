import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class SecondPageScreen extends StatefulWidget {
  String day;
  SecondPageScreen({super.key, required this.day});

  @override
  State<SecondPageScreen> createState() => _SecondPageScreenState();
}

class _SecondPageScreenState extends State<SecondPageScreen> {
  File? image;
  List<Map<String, dynamic>> caption = [
    {
      'day': "Day 3",
      'caption-1': "#rnw_workshop",
      'caption-2': "#rnw_app",
      'caption-3': "#rnw",
      'caption-4': "",
    },
    {
      'day': "Day 4",
      'caption-1': "#rnw_workshop",
      'caption-2': "#rnw_app",
      'caption-3': "#rnw",
      'caption-4': "",
    },
    {
      'day': "Day 5",
      'caption-1': "#rnw_workshop",
      'caption-2': "#rnw_app",
      'caption-3': "#rnw",
      'caption-4': "#BuildWithGemini",
    },
  ];
  GlobalKey imageKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "RNW",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: textScaler.scale(25),
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   actions: [
      //     CircleAvatar(
      //       radius: w * 0.06,
      //       backgroundColor: Colors.grey.shade200,
      //       child: CircleAvatar(
      //         radius: w * 0.05,
      //         backgroundColor: Colors.white,
      //         foregroundImage:
      //             const AssetImage("assets/images/home_page/rnw_logo.png"),
      //       ),
      //     ),
      //     SizedBox(
      //       width: w * 0.03,
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: EdgeInsets.all(w * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: w * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.day.split(' ')[0],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: textScaler.scale(40),
                            fontWeight: FontWeight.bold,
                            height: -h * 0.001,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image(
                      image: AssetImage(
                        "assets/images/home_page/${widget.day}.png",
                      ),
                      height: h * 0.15,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () async {
                    ImagePicker picker = ImagePicker();

                    XFile? xFile =
                        await picker.pickImage(source: ImageSource.gallery);

                    setState(() {
                      if (xFile != null) {
                        image = File(xFile.path);
                      }
                    });
                  },
                  child: (image != null)
                      ? RepaintBoundary(
                          key: imageKey,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(image!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.all(h * 0.01),
                            child: Image.asset(
                              "assets/images/second_page/rnw_logo.png",
                              height: h * 0.05,
                            ),
                          ),
                        )
                      : Text(
                          "Select Pick",
                          style: TextStyle(
                            fontSize: textScaler.scale(25),
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                            decoration: TextDecoration.combine(
                              [TextDecoration.underline],
                            ),
                            decorationColor: Colors.blue,
                            letterSpacing: 1,
                          ),
                        ),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  "Caption",
                  style: TextStyle(
                    fontSize: textScaler.scale(25),
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...caption
                        .map(
                          (e) => (e['day'] == widget.day)
                              ? Text(
                                  "${e['caption-1']}   ${e['caption-2']}   ${e['caption-3']}\n${(e['caption-4'] != null) ? e['caption-4'] : ""}",
                                  style: TextStyle(
                                    fontSize: textScaler.scale(15),
                                  ),
                                )
                              : const Text(""),
                        )
                        .toList()
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        caption.map((e) {
                          if (e['day'] == widget.day) {
                            Clipboard.setData(
                              ClipboardData(
                                  text:
                                      "${e['caption-1']} ${e['caption-2']} ${e['caption-3']} ${(e['caption-4'] != null) ? e['caption-4'] : ""}"),
                            ).then((value) {
                              SnackBar snackBar = SnackBar(
                                content: const Text(
                                  "Caption copied!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                dismissDirection: DismissDirection.horizontal,
                                backgroundColor: Colors.black12,
                                margin: EdgeInsets.all(w * 0.05),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(w * 0.03),
                                ),
                                behavior: SnackBarBehavior.floating,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          }
                        }).toList();
                      },
                      child: const Text("copy caption"),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.05,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (image != null) {
                          RenderRepaintBoundary boundary =
                              imageKey.currentContext!.findRenderObject()
                                  as RenderRepaintBoundary;
                          final image = await boundary.toImage();

                          ByteData? byteData = await image.toByteData(
                            format: ImageByteFormat.png,
                          );

                          if (byteData != null) {
                            final result = await ImageGallerySaver.saveImage(
                              byteData.buffer.asUint8List(),
                            );
                            log("image saved at $result");
                            SnackBar snackBar = SnackBar(
                              content: const Text(
                                "Image saved!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              dismissDirection: DismissDirection.horizontal,
                              backgroundColor: Colors.green.withOpacity(0.6),
                              margin: EdgeInsets.all(w * 0.05),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(w * 0.03),
                              ),
                              behavior: SnackBarBehavior.floating,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                        // final pngBytes = byteData!.buffer.asUint8List();

                        //
                        // final directory =
                        //     await getApplicationDocumentsDirectory();
                        // final file =
                        //     await File('${directory.path}/day3.png').create();
                        // await file.writeAsBytes(pngBytes);
                      },
                      child: const Text("Save Image"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
