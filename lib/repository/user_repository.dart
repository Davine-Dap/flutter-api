import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:latihan_7/models/user_models.dart';
import 'package:latihan_7/params/user_params.dart';
import 'package:latihan_7/repository/responsis/user_create_response.dart';

class UserRepository{

  Future<List<UserModel>> getUserModels() async {
    try{
      //var response = await Dio().get('https://dummyjson.com/users');
      //debugPrint('Response users : ${response.data['users']}');
      var response = await Dio().get('http://54.243.8.93:8000/api/users');
      debugPrint('Response users : ${response.data}');
      List list = response.data['users'];
      List<UserModel> listUser = list.map((element) => UserModel.fromJson(element)).toList();
      return listUser;
    } on DioException catch(e){
      throw Exception(e);
    }
  }
  Future<UserCreateResponse> addUser(UserParam userParam) async{
    try {
      var response = await Dio() .post('http://54.243.8.93:8000/api/users', data: userParam.toJson());
      debugPrint('POST Response : ${response.data}');
      return UserCreateResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception();
    }
  }
}