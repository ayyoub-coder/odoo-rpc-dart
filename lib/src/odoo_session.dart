/// Odoo Session Object

import 'package:meta/meta.dart';

/// Represents session with Odoo server.
class OdooSession {
  /// Current Session id
  final String id;

  /// User's database id
  final int userId;

  /// User's partner database id
  final int partnerId;

  /// User's company database id
  final int companyId;

  /// User's name
  final String userName;

  /// User's language
  final String userLang;

  /// User's Time zone
  final String userTz;

  /// Is internal user or not
  final bool isSystem;

  /// Server Major version
  final int serverVersion;

  /// [OdooSession] is immutable.
  const OdooSession({
    @required this.id,
    @required this.userId,
    @required this.partnerId,
    @required this.companyId,
    @required this.userName,
    @required this.userLang,
    @required this.userTz,
    @required this.isSystem,
    @required this.serverVersion,
  });

  /// Creates [OdooSession] instance from odoo session info object.
  static OdooSession fromSessionInfo(Map<String, Object> info) {
    final Map<String, Object> ctx = info['user_context'] as Map<String, Object>;
    final List<dynamic> versionInfo = info['server_version_info'];
    return OdooSession(
      id: info['id'] as String,
      userId: info['uid'] as int,
      partnerId: info['partner_id'] as int,
      companyId: info['company_id'] as int,
      userName: info['name'] as String,
      userLang: ctx['lang'] as String,
      userTz: ctx['tz'] as String,
      isSystem: info['is_system'] as bool,
      serverVersion: versionInfo[0] as int,
    );
  }

  /// Stores [OdooSession] to JSON
  Map<String, Object> toJson() {
    return {
      'id': id,
      'userId': userId,
      'partnerId': partnerId,
      'companyId': companyId,
      'userName': userName,
      'userLang': userLang,
      'userTz': userTz,
      'isSystem': isSystem,
      'serverVersion': serverVersion,
    };
  }

  /// Restore [OdooSession] from JSON
  static OdooSession fromJson(Map<String, Object> json) {
    return OdooSession(
      id: json['id'] as String,
      userId: json['userId'] as int,
      partnerId: json['partnerId'] as int,
      companyId: json['companyId'] as int,
      userName: json['userName'] as String,
      userLang: json['userLang'] as String,
      userTz: json['userTz'] as String,
      isSystem: json['isSystem'] as bool,
      serverVersion: json['serverVersion'] as int,
    );
  }

  /// Returns new OdooSession instance with updated session id
  OdooSession updateSessionId(String newSessionId) {
    return OdooSession(
      id: newSessionId,
      userId: userId,
      partnerId: partnerId,
      companyId: companyId,
      userName: userName,
      userLang: userLang,
      userTz: userTz,
      isSystem: isSystem,
      serverVersion: serverVersion,
    );
  }

  /// String representation of [OdooSession] object.
  @override
  String toString() {
    return 'OdooSession {userName: $userName, userId: $userId, companyId: $companyId, id: $id}';
  }

}