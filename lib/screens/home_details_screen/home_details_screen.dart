import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sovware_assignment/AppStyle/app_style.dart';
import 'package:sovware_assignment/constant/app_constant.dart';
import '../../models/home_hive_dm.dart';

class HomeDetailsScreen extends StatelessWidget {
  final HomeHiveDm data;
  const HomeDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppStyle.backgroundColor,
        appBar: AppBar(title: Text(data.fullName)),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * .03),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: data.avatar,
                    fit: BoxFit.cover,
                    height: height * .2,
                    width: height * .2,
                  ),
                ),
              ),
              SizedBox(height: height * .03),
              Container(
                width: width,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.ownerName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: height * .02),
                    Text(
                      data.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: height * .02),
                    Text(
                      "Last Update: ${AppConstant.dateTimeFomar(data.updatedAt)}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: height * .02),
                    Text(
                      "Total Star: ${data.stargazersCount}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
