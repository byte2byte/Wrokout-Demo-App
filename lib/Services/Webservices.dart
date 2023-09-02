import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:workout_demo_app/Utils/Constants.dart';
import '../Models/ExcerciseListModel.dart';

class Webservices {
  static Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'content-type': 'application/json',
    'X-RapidAPI-Key': Constants.apiKey
  }; // header

  static var options = BaseOptions(
    headers: header,
    baseUrl: "https://exercisedb.p.rapidapi.com/",
  );
  Dio dio = Dio(options);

  //API Method for Fetching List of Excersizes
  Future<List<ExcerciseListModel>?> fetchAllExcersize() async {
    try {
      Response res = await dio.get(
        "exercises",
      );
      final excerciseListModel = List<ExcerciseListModel>.from(
          res.data.map((x) => ExcerciseListModel.fromJson(x)));
      return excerciseListModel;
    } on DioException catch (d) {
      if (d.response != null) {
        log("\nFatal DioError with code:- ${d.response?.statusCode}",
            name: "fetchAllExcersize");
        if (d.response?.statusCode == 500) {
          return null;
        }
      }
      return null;
    } catch (e) {
      log("Fatal Error in Fetching List Of Excercise API:- ${e.toString()}",
          name: "fetchAllExcersize");
      return null;
    }
  }

  //API Method for Fetching Specific Excersizes
  Future<ExcerciseListModel?> getExcersize(String id) async {
    try {
      Response res = await dio.get(
        "exercises/exercise/$id",
      );
      final excerciseListModel = ExcerciseListModel.fromJson(res.data);
      return excerciseListModel;
    } on DioException catch (d) {
      if (d.response != null) {
        log("\nFatal DioError with code:- ${d.response?.statusCode}",
            name: "getExcersize");
        if (d.response?.statusCode == 500) {
          return null;
        }
      }
      return null;
    } catch (e) {
      log("Fatal Error in Fetching Specific Excercise API:- ${e.toString()}",
          name: "getExcersize");
      return null;
    }
  }
}
