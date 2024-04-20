// Save list of DetailsModel to shared preferences
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/details_model.dart';

class AppLocalStorge {
  Future<void> saveDetailsList(List<DetailsModel> detailsList) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> serializedList =
        detailsList.map((details) => json.encode(details.toJson())).toList();
    await prefs.setStringList('detailsList', serializedList);
  }

// Get list of DetailsModel from shared preferences
  Future<List<DetailsModel>> getDetailsList() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? serializedList = prefs.getStringList('detailsList');
    if (serializedList == null) {
      return [];
    }
    return serializedList
        .map((serializedDetails) =>
            DetailsModel.fromJson(json.decode(serializedDetails)))
        .toList();
  }

// Add a single DetailsModel object to the existing list in shared preferences
  void addDetailsToList(DetailsModel newDetail) async {
    List<DetailsModel> detailsList = await getDetailsList();
    if (detailsList.isEmpty) {
      detailsList.add(newDetail);
      saveDetailsList(detailsList);
    } else if (detailsList
        .where((element) => element.id == newDetail.id)
        .isNotEmpty) {
    } else {
      detailsList.add(newDetail);
      saveDetailsList(detailsList);
    }
  }

  void deleteDetailsToList(int id) async {
    List<DetailsModel> detailsList = await getDetailsList();
    if (detailsList.isEmpty) {
      detailsList.removeLast();
      saveDetailsList(detailsList);
      // } else if (detailsList
      //     .where((element) => element.id == newDetail.id)
      //     .isNotEmpty) {
    } else {
      print(detailsList.removeAt(detailsList[id].id!));
      detailsList.removeWhere((element) => detailsList[id] == id);
      saveDetailsList(detailsList);
    }
  }

  Future<int> isFound(int id) async {
    List<DetailsModel> details = await getDetailsList();
    return details.firstWhere((element) => element.id == id).id!;
  }
}
