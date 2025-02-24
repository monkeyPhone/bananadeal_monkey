import 'package:dio/dio.dart';

class DioEntity{
  final String url;
  final String dto;
  FormData? form;
  Options? options;

  DioEntity({
    required this.url,
    required this.dto,
    this.form,
    this.options,
  });
}