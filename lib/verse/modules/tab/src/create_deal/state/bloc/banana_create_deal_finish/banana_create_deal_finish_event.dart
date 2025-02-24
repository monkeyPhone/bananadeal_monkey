part of 'banana_create_deal_finish_bloc.dart';

sealed class BananaCreateDealFinishEvent extends Equatable {
  const BananaCreateDealFinishEvent();

  @override
  List<Object> get props => [];
}

final class ConvertData extends BananaCreateDealFinishEvent {
  final int userIdx;
  final String age;
  final String currentAgency;
  final String requestAgency;
  final String psIdx;
  final String ldcpName;
  final String recModel;
  final String ldcpModel;
  final String piPath;
  final String planIdx;
  final String plan;
  final String recRate;
  final String maxInstallment;
  final String supportType;
  final String combination;
  final String welfare;
  final String request;

  const ConvertData({
    required this.userIdx,
    required this.age,
    required this.currentAgency,
    required this.requestAgency,
    required this.psIdx,
    required this.ldcpName,
    required this.recModel,
    required this.ldcpModel,
    required this.piPath,
    required this.planIdx,
    required this.plan,
    required this.recRate,
    required this.maxInstallment,
    required this.supportType,
    required this.combination,
    required this.welfare,
    required this.request,
  });
}


final class PostDeal extends BananaCreateDealFinishEvent {
  const PostDeal();
}
