import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_assignment/screens/home_details_screen/home_details_screen.dart';
import 'package:sovware_assignment/screens/home_screen/bloc/home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../AppStyle/app_style.dart';
import '../../resources/api_provider.dart';
import '../../widget/custom_progress.dart';
import '../../widget/no_internet_widget.dart';

enum FilterEnum { date, star }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<ApiProvider>(context),
      )..add(LoadHomeDataEvent()),
      child: Scaffold(
        backgroundColor: AppStyle.backgroundColor,
        appBar: AppBar(
          title: const Text("Top 50 Flutter Repositories"),
          centerTitle: false,
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.filter_alt_outlined),
              onSelected: (value) {
                if (value == FilterEnum.date) {
                  BlocProvider.of<HomeBloc>(context).add(FilterByDateEvent());
                } else {
                  BlocProvider.of<HomeBloc>(context).add(FilterByStarEvent());
                }
              },
              offset: Offset(0.0, AppBar().preferredSize.height),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              itemBuilder: (ctx) => [
                _buildPopupMenuItem(
                    'Date/Time', Icons.date_range, FilterEnum.date),
                _buildPopupMenuItem('Star', Icons.star, FilterEnum.star)
              ],
            )
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeNoInternetState) {
              return const NoInternetWidget();
            }
            if (state is HomeLoadingState) {
              return const CustomProgress();
            }

            if (state is HomeLoadedState) {
              return ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: state.homeData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeDetailsScreen(
                                      data: state.homeData[index],
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.height * .07,
                                imageUrl: state.homeData[index].avatar,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(state.homeData[index].fullName,
                                  maxLines: 1),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData, FilterEnum filterEnum) {
    return PopupMenuItem(
      value: filterEnum,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}
