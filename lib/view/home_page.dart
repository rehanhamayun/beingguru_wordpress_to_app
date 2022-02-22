import 'package:beingguru/controller/beingguru_controller.dart';
import 'package:beingguru/controller/beingguru_images_controller.dart';
import 'package:beingguru/model/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:get/instance_manager.dart';
import 'package:sizer/sizer.dart';

class Homepage extends StatelessWidget {
  // Dependency Injection
  BeingGuruController beingGuruController = Get.put(BeingGuruController());
  BeinGuruImagesController beinGuruImagesController =
      Get.put(BeinGuruImagesController());
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(beingGuruController.blogs.toString());
    print(beinGuruImagesController.images.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "BeingGuru",
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: beingGuruController.blogs.length,
            itemBuilder: (context, index) {
              //DIRECT WITHOUT IF ELSE

              return Container(
                width: 90.w,
                height: 40.h,
                child: Card(
                  elevation: 0.0,
                  child: Column(
                    children: [
                      // TITLE
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          beingGuruController.blogs[index]['title']['rendered']
                              .toString()
                              .replaceAll("Upwork&#8217;s", "")
                              .replaceAll("Here&#8217;s", ""),
                          style: GoogleFonts.lato(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        height: 0.5.h,
                      ),
                      //PUBLISH DATE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            beingGuruController.blogs[index]['date']
                                .toString()
                                .replaceAll("T", "Time"),
                            style: GoogleFonts.lato(
                              color: Colors.grey.withOpacity(0.6),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          blogIMG,
                          height: 20.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Read full blog"),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
      drawer: Drawer(),
    );
  }
}
