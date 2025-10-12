import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:dio/dio.dart';

@override

Future<Either<Failure,T>> handleRequest<T>(
   {required Future<Map<String,dynamic>> Function() request, required T Function(Map<String, dynamic> json) converter,}
) async{

  try {
    final response = await request() ;
  final data = converter(response);
  return right(data);
  } on DioException catch (dioError) {
      return left(ServiceFailure.fromDio(dioError));
    } catch (e) {
      return left(ServiceFailure(e.toString()));
  }

  }
