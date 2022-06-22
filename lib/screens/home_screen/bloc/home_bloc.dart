import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sovware_assignment/models/home_hive_dm.dart';
import 'package:sovware_assignment/services/home_service.dart';
import '../../../resources/api_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiProvider _apiProvider;

  final HomeService _imageService = HomeService();

  HomeBloc(this._apiProvider) : super(HomeLoadingState()) {
    on<LoadHomeDataEvent>((event, emit) async {
      await _imageService.init();
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        final result = _imageService.getImageList();
        if (result.isEmpty) {
          emit(HomeNoInternetState());
        } else {
          final result = _imageService.getImageList();

          emit(HomeLoadedState(result));
        }
      } else {
        emit(HomeLoadingState());
        final response = await _apiProvider.getGalleryData();
        for (var i = 0; i < response!.length; i++) {
       
          var data = HomeHiveDm(
              name: "${response[i].name}",
              fullName: "${response[i].fullName}",
              avatar: "${response[i].owner!.avatarUrl}",
              htmlUrl: "${response[i].htmlUrl}",
              description: "${response[i].description}",
              gitUrl: "${response[i].gitUrl}",
              createdAt:"${response[i].createdAt}",
              updatedAt: "${response[i].updatedAt}",
              size:"${response[i].size}",
              stargazersCount:"${response[i].stargazersCount}",
              ownerName: "${response[i].owner!.login}",
              id: "${response[i].id}",
             );

          if (!isExist(data)) {
            _imageService.addImageToList(data);
          }
        }
        final result = _imageService.getImageList();
        emit(HomeLoadedState(result));
      }
    });

       on<HomeNoInternetEvent>((event, emit) {
      emit(HomeNoInternetState());
    });
  }

    bool isExist(HomeHiveDm data) {
    final result = _imageService.getImageList();
    return result.length >= 0
        ? result.any((HomeHiveDm item) => item.id == data.id)
        : false;
  }
}
