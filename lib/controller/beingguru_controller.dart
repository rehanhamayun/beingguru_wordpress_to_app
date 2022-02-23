import 'package:beingguru/controller/beingguru_repository.dart';
//import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class BeingGuruController extends GetxController {
  //Blogs Data
  BeingGuru beingGuru = BeingGuru();

  // Empty list that holds all data after assigning / BLOGS DATA
  List blogs = [];

  // LOAD BLOGS FROM REPO
  BeingGuruController() {
    loadBlogsfromRepo();
  }

  // LOAD IMAGES FROM REPO

// Loading
  RxBool loading = false.obs;

  // Load Blogs Data from Repository

  loadBlogsfromRepo() async {
    loading(false);
    final finalBlogs = await beingGuru.fetchBlogsData();
    loading(true);

    // assign all blogs posts to LIST i.e empty
    blogs.assignAll(finalBlogs);
  }
}
