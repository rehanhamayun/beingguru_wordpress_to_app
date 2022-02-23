import 'package:beingguru/controller/beingguru_controller.dart';
import 'package:beingguru/view/blog_details.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  // Dependency Injection
  BeingGuruController beingGuruController = Get.put(BeingGuruController());

  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(beingGuruController.blogs.toString());

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
              // Data store in variable of per blog
              var storeBlog = beingGuruController.blogs[index].toString();

              return Container(
                width: 90.w,
                height: 42.h,
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
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(
                        height: 0.5.h,
                      ),
                      //PUBLISH DATE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            " Author:  ${beingGuruController.blogs[index]['_embedded']['author'][0]['name'].toString()}",
                            style: GoogleFonts.lato(
                              color: Colors.grey.withOpacity(0.6),
                              fontSize: 11,
                            ),
                          ),
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
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          beingGuruController.blogs[index]['_embedded']
                              ['wp:featuredmedia'][0]['source_url'],
                          height: 20.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Status
                          Text(
                            "Status: ${beingGuruController.blogs[index]['status'].toString()}  ",
                            style: GoogleFonts.lato(
                              color: Colors.grey.withOpacity(0.6),
                              fontSize: 11,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple, elevation: 0.0),
                            onPressed: () {
                              Get.to(() => BlogDetails());
                            },
                            child: Text(
                              "Read full blog",
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
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
