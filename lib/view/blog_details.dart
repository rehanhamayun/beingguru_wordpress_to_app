import 'package:beingguru/controller/beingguru_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class PostDetails extends StatelessWidget {
  BeingGuruController beingGuruController = Get.put(BeingGuruController());
  PostDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ListView.builder(itemBuilder: ((context, index) {
              return Container();
            }))
          ],
        ),
      ),
    );
  }
}
