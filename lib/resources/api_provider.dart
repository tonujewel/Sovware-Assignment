
import 'package:http/http.dart';
import 'package:sovware_assignment/models/home_dm.dart';



class ApiProvider {

  Future<List<Item>?> getGalleryData() async {
   

    final response = await get(
        Uri.parse('https://api.github.com/search/repositories?q=Flutter&page=0&per_page=50'),
      );

    HomeDm galleryDm = homeDmFromJson(response.body);
    return galleryDm.items;
  }
}
