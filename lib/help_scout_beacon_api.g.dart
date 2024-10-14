// Autogenerated from Pigeon (v17.3.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

/// Beacon route/screen
/// * https://developer.helpscout.com/beacon-2/android-api/beacon/com.helpscout.beacon.model/-beacon-screens/index.html
enum HSBeaconRoute {
  /// Opens to the Home (Ask/Answers) screen (default value)
  ask,
  /// Chat screen
  chat,
  /// Open docs with optional search parameter (requires docs enabled and optionally a search param)
  docs,
  /// Article screen (requires an Article ID and docs enabled)
  article,
  /// Contact form (requires messaging enabled)
  contactForm,
  /// Previous Messages if any exist.
  previousMessages,
}

/// HSBeaconFocusMode represents various configuration modes of Beacon. Allowing you to customize the experience your users have, from getting in contact right away, to a more self service approach.
/// * More info is available AT https://docs.helpscout.com/article/1296-work-with-beacon-modes
enum HSBeaconFocusMode {
  /// An option to see both help articles and contact options side by side
  neutral,
  /// An option to see help articles first and contact options after interacting with content
  selfService,
  /// An option to see contact options first and help articles second
  askFirst,
}

/// Beacon Settings overrides
/// * https://developer.helpscout.com/beacon-2/android-api/beacon/com.helpscout.beacon.model/-beacon-screens/index.html
/// * https://developer.helpscout.com/beacon-2/ios-api/Classes/HSBeaconSettings.html
class HSBeaconSettings {
  HSBeaconSettings({
    required this.beaconId,
    this.debugLogging = false,
    this.beaconTitle,
    this.docsEnabled,
    this.messagingEnabled,
    this.chatEnabled,
    this.enablePreviousMessages = true,
    this.focusMode,
  });

  /// The Beacon ID to use.
  String beaconId;

  /// Turn Logging on/off (should be disabled in production)
  bool debugLogging;

  /// The title used in the main Beacon interface. This is Support by default.
  String? beaconTitle;

  /// Disable the Docs integration manually if it’s enabled in the Beacon config.
  /// This will not enable Docs if it’s disabled in the config.
  bool? docsEnabled;

  /// Disable the contact options manually if it’s enabled in the Beacon config.
  /// This will not enable the contact options if it’s disabled in the config.
  bool? messagingEnabled;

  /// Disable the Chat integration manually if it’s enabled in the Beacon config.
  /// This will not enable Chat if it’s disabled in the config.
  bool? chatEnabled;

  /// Disable previous messages manually if messaging is enabled in the Beacon config.
  bool enablePreviousMessages;

  /// If your Beacon has Docs and Messaging (email or chat) enabled, this mode controls the user experience of the beacon
  HSBeaconFocusMode? focusMode;

  Object encode() {
    return <Object?>[
      beaconId,
      debugLogging,
      beaconTitle,
      docsEnabled,
      messagingEnabled,
      chatEnabled,
      enablePreviousMessages,
      focusMode?.index,
    ];
  }

  static HSBeaconSettings decode(Object result) {
    result as List<Object?>;
    return HSBeaconSettings(
      beaconId: result[0]! as String,
      debugLogging: result[1]! as bool,
      beaconTitle: result[2] as String?,
      docsEnabled: result[3] as bool?,
      messagingEnabled: result[4] as bool?,
      chatEnabled: result[5] as bool?,
      enablePreviousMessages: result[6]! as bool,
      focusMode: result[7] != null
          ? HSBeaconFocusMode.values[result[7]! as int]
          : null,
    );
  }
}

/// Beacon user
/// * https://developer.helpscout.com/beacon-2/android-api/beacon/com.helpscout.beacon.model/-beacon-user/index.html
/// * https://developer.helpscout.com/beacon-2/ios-api/Classes/HSBeaconUser.html
class HSBeaconUser {
  HSBeaconUser({
    required this.email,
    this.name,
    this.company,
    this.jobTitle,
    this.avatar,
    this.attributes,
  });

  /// The email address for the current user.
  String email;

  /// The name of the current user.
  String? name;

  /// The company of the current user. The max length of this value is 60 and will be truncated to fit.
  String? company;

  /// The job title of the current user. The max length of this value is 60 and will be truncated to fit.
  String? jobTitle;

  /// The URL to the avatar of the current user. The max length of this value is 200 and will not be set if the absoluteString exceeds that length.
  String? avatar;

  /// The attributes for the current user. These are arbitrary key/value pairs that will be sent to Help Scout to help identify the current user. You may add up to 30 different attributes.
  Map<Object?, Object?>? attributes;

  Object encode() {
    return <Object?>[
      email,
      name,
      company,
      jobTitle,
      avatar,
      attributes,
    ];
  }

  static HSBeaconUser decode(Object result) {
    result as List<Object?>;
    return HSBeaconUser(
      email: result[0]! as String,
      name: result[1] as String?,
      company: result[2] as String?,
      jobTitle: result[3] as String?,
      avatar: result[4] as String?,
      attributes: result[5] as Map<Object?, Object?>?,
    );
  }
}

class HSBeaconSession {
  HSBeaconSession({
    this.attributes,
  });

  Map<Object?, Object?>? attributes;

  Object encode() {
    return <Object?>[
      attributes,
    ];
  }

  static HSBeaconSession decode(Object result) {
    result as List<Object?>;
    return HSBeaconSession(
      attributes: result[0] as Map<Object?, Object?>?,
    );
  }
}

class HSBeaconForm {
  HSBeaconForm({
    required this.name,
    required this.subject,
    required this.message,
    this.customFieldValues,
    this.attachments,
    required this.email,
  });

  String name;

  String subject;

  String message;

  Map<Object?, Object?>? customFieldValues;

  List<Object?>? attachments;

  String email;

  Object encode() {
    return <Object?>[
      name,
      subject,
      message,
      customFieldValues,
      attachments,
      email,
    ];
  }

  static HSBeaconForm decode(Object result) {
    result as List<Object?>;
    return HSBeaconForm(
      name: result[0]! as String,
      subject: result[1]! as String,
      message: result[2]! as String,
      customFieldValues: result[3] as Map<Object?, Object?>?,
      attachments: result[4] as List<Object?>?,
      email: result[5]! as String,
    );
  }
}

class _HelpScoutBeaconApiCodec extends StandardMessageCodec {
  const _HelpScoutBeaconApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is HSBeaconForm) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is HSBeaconSession) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is HSBeaconSettings) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is HSBeaconUser) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return HSBeaconForm.decode(readValue(buffer)!);
      case 129: 
        return HSBeaconSession.decode(readValue(buffer)!);
      case 130: 
        return HSBeaconSettings.decode(readValue(buffer)!);
      case 131: 
        return HSBeaconUser.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Help Scout Beacon API
class HelpScoutBeaconApi {
  /// Constructor for [HelpScoutBeaconApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  HelpScoutBeaconApi({BinaryMessenger? binaryMessenger})
      : __pigeon_binaryMessenger = binaryMessenger;
  final BinaryMessenger? __pigeon_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _HelpScoutBeaconApiCodec();

  /// Initialize the beacon with a beaconId and optional settings
  Future<void> setup({required HSBeaconSettings settings}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.help_scout_beacon.HelpScoutBeaconApi.setup';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[settings]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Signs in with a Beacon user. This gives Beacon access to the user’s name, email address, and signature.
  Future<void> identify({required HSBeaconUser beaconUser}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.help_scout_beacon.HelpScoutBeaconApi.identify';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[beaconUser]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> addSession({required HSBeaconSession session}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.help_scout_beacon.HelpScoutBeaconApi.addSession';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[session]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> addPreFilled({required HSBeaconForm form}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.help_scout_beacon.HelpScoutBeaconApi.addPreFilled';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[form]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Opens the Beacon SDK from a specific view controller. The Beacon view controller will be presented as a modal.
  Future<void> open({required HSBeaconSettings settings, HSBeaconRoute route = HSBeaconRoute.ask, String? parameter,}) async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.help_scout_beacon.HelpScoutBeaconApi.open';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(<Object?>[settings, route.index, parameter]) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Logs the current Beacon user out and clears out their information from local storage.
  Future<void> clear() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.help_scout_beacon.HelpScoutBeaconApi.clear';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> reset() async {
    const String __pigeon_channelName = 'dev.flutter.pigeon.help_scout_beacon.HelpScoutBeaconApi.reset';
    final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<Object?>(
      __pigeon_channelName,
      pigeonChannelCodec,
      binaryMessenger: __pigeon_binaryMessenger,
    );
    final List<Object?>? __pigeon_replyList =
        await __pigeon_channel.send(null) as List<Object?>?;
    if (__pigeon_replyList == null) {
      throw _createConnectionError(__pigeon_channelName);
    } else if (__pigeon_replyList.length > 1) {
      throw PlatformException(
        code: __pigeon_replyList[0]! as String,
        message: __pigeon_replyList[1] as String?,
        details: __pigeon_replyList[2],
      );
    } else {
      return;
    }
  }
}
