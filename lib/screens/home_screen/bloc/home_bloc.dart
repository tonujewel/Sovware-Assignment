import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sovware_assignment/constant/app_constant.dart';
import 'package:sovware_assignment/models/home_hive_dm.dart';
import 'package:sovware_assignment/services/home_service.dart';
import '../../../resources/api_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiProvider _apiProvider;

  final HomeService _homeService = HomeService();

  HomeBloc(this._apiProvider) : super(HomeLoadingState()) {
    on<LoadHomeDataEvent>((event, emit) async {
      // shared preference
      final prefs = await SharedPreferences.getInstance();

      await _homeService.init();

      // check internet
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        final result = _homeService.getImageList();
        if (result.isEmpty) {
          emit(HomeNoInternetState());
        } else {
          final result = _homeService.getImageList();
          emit(HomeLoadedState(result));
        }
      } else {
        // check last api call ----
        if (doApiCall(prefs.getString(AppConstant.lastApiCallTimeKey)) ==
            true) {
          emit(HomeLoadingState());
          prefs.setString(
              AppConstant.lastApiCallTimeKey, DateTime.now().toString());
          final response = await _apiProvider.getGalleryData();
          for (var i = 0; i < response!.length; i++) {
            var data = HomeHiveDm(
              name: "${response[i].name}",
              fullName: "${response[i].fullName}",
              avatar: "${response[i].owner!.avatarUrl}",
              htmlUrl: "${response[i].htmlUrl}",
              description: "${response[i].description}",
              gitUrl: "${response[i].gitUrl}",
              createdAt: "${response[i].createdAt}",
              updatedAt: "${response[i].updatedAt}",
              size: "${response[i].size}",
              stargazersCount: "${response[i].stargazersCount}",
              ownerName: "${response[i].owner!.login}",
              id: "${response[i].id}",
              pushedAt: response[i].pushAt.toString(),
            );

            if (!isExist(data)) {
              _homeService.addImageToList(data);
            }
          }
          final result = _homeService.getImageList();
          emit(HomeLoadedState(result));
        } else {
          final result = _homeService.getImageList();
          emit(HomeLoadedState(result));
        }
      }
    });

    on<HomeNoInternetEvent>((event, emit) {
      emit(HomeNoInternetState());
    });

    on<FilterByDateEvent>((event, emit) async {
      await _homeService.init();
      emit(HomeLoadingState());
      final result = _homeService.sortByDate();

      emit(HomeLoadedState(result));
    });
    on<FilterByStarEvent>((event, emit) async {
      await _homeService.init();
        emit(HomeLoadingState());
      final result = _homeService.sortByStar();
      emit(HomeLoadedState(result));
    });
  }

  bool isExist(HomeHiveDm data) {
    final result = _homeService.getImageList();
    return result.length >= 0
        ? result.any((HomeHiveDm item) => item.id == data.id)
        : false;
  }

  bool doApiCall(String? previousTime) {
    if (previousTime == null) {
      return true;
    } else if (AppConstant.timeDifference(previousTime) > 30) {
      return true;
    } else {
      return false;
    }
  }
}
