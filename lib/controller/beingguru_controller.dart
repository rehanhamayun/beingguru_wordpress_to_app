import 'package:beingguru/controller/beingguru_repository.dart';
//import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class BeingGuruController extends GetxController {
  //Blogs Data
  BeingGuru beingGuru = BeingGuru();

  //Images Data

  //BeingGuruImages beingGuruImages = BeingGuruImages();

  // Empty list that holds all data after assigning / BLOGS DATA
  List blogs = [];

  // EMPTY IMAGES LIST THAT HOLDS ALL DATA AFTER GETTING ASSIGNER / IMAGES DATA
  // List images = [];

  // LOAD BLOGS FROM REPO
  BeingGuruController() {
    loadBlogsfromRepo();
  }

  // LOAD IMAGES FROM REPO

// Loading
  RxBool loading = false.obs;

  loadBlogsfromRepo() async {
    loading(false);
    final finalBlogs = await beingGuru.fetchBlogsData();
    loading(true);

    // loadImagesfromRepo() async {
    // loading(false);
    //final finalImages = await beingGuruImages.fetchImages();
    //loading(true);
    //  }

    // assign all blogs posts to LIST i.e empty
    blogs.assignAll(finalBlogs);
  }
}
