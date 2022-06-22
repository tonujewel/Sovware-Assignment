import 'package:hive/hive.dart';
import 'package:sovware_assignment/models/home_hive_dm.dart';


class HomeService {
  late Box<HomeHiveDm> hiveBox;
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(HomeHiveDmAdapter());
    }

    hiveBox = await Hive.openBox<HomeHiveDm>("HomeData");
  }

  List<HomeHiveDm> getImageList() {
    final homeList = hiveBox.values;
    return homeList.toList();
  }

  void addImageToList(HomeHiveDm homeData) {
    hiveBox.add(homeData);
  }

  Future<void> updateGallery(HomeHiveDm homeData) async {
    final taskToUpdate =
        hiveBox.values.firstWhere((element) => element.id == homeData.id);
    final index = taskToUpdate.key as int;
    await hiveBox.put(index, homeData);
  }
}
