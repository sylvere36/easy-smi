import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../domain/campaign/models/campaign_item.dart';
import '../../../domain/campaign/models/communication_action_plan.dart';
import '../../_commons/exceptions.dart';
import '../../_commons/network/app_requests.dart';
import '../../_commons/throw_error.dart';

abstract class ICampaignRemoteDataSource {
  Future<List<CampaignItem>> getCampaigns();
  Future<CampaignItem> getCampaignDetail({required int id});
  Future<List<CommunicationActionPlan>> getCommunicationActionPlans({
    required int campaignId,
  });
}

class CampaignRemoteDataSource implements ICampaignRemoteDataSource {
  final IAppRequests httpClient;
  CampaignRemoteDataSource({required this.httpClient});

  @override
  Future<List<CampaignItem>> getCampaigns() async {
    try {
      const String request = '/formation/campaigns';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = data['success'] == true;
        if (!success) {
          final message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final List<dynamic> rawList =
            (data['data'] as List<dynamic>?) ?? const [];
        return rawList
            .whereType<Map<String, dynamic>>()
            .map(CampaignItem.fromJson)
            .toList();
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CampaignItem> getCampaignDetail({required int id}) async {
    try {
      final String request = '/formation/campaigns/$id';
      final Response response = await httpClient.getRequest(request);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = data['success'] == true;
        if (!success) {
          final message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final Map<String, dynamic> jsonItem =
            data['data'] as Map<String, dynamic>? ?? <String, dynamic>{};
        return CampaignItem.fromJson(jsonItem);
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<CommunicationActionPlan>> getCommunicationActionPlans({
    required int campaignId,
  }) async {
    try {
      const String request = '/formation/communication-action-plans';
      final Response response = await httpClient.getRequest(
        request,
        queryParameters: {'campaign_id': campaignId},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data is String
            ? json.decode(response.data as String) as Map<String, dynamic>
            : (response.data as Map<String, dynamic>);
        final success = data['success'] == true;
        if (!success) {
          final message = (data['message'] as String?) ?? '';
          throw ServerException(message);
        }
        final List<dynamic> rawList =
            (data['data'] as List<dynamic>?) ?? const [];
        return rawList
            .whereType<Map<String, dynamic>>()
            .map(CommunicationActionPlan.fromJson)
            .toList();
      } else {
        throw ServerException(errorThrow(response));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
