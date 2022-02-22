import 'package:beingguru/controller/beingguru_images_repository.dart';
//import 'package:beingguru/controller/beingguru_repository.dart';
//import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class BeinGuruImagesController extends GetxController {
  BeingGuruImages beingGuruImages = BeingGuruImages();
  List images = [];
  RxBool loading = false.obs;

  BeinGuruImagesController() {
    loadImagesfromRepo();
  }

  loadImagesfromRepo() async {
    loading(false);
    final finalImages = await beingGuruImages.fetchImages();
    loading(true);

    images.assignAll(finalImages);
  }
}
