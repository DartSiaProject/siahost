import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  factory NotificationService() => _instance;
  NotificationService._();
  static final NotificationService _instance = NotificationService._();

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  // channel IDs
  static const _downloadChannelId = 'download_channel';
  static const _pushChannelId = 'push_channel';

  Future<void> init() async {
    // init settings
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    await _plugin.initialize(
      const InitializationSettings(
        android: androidInit,
        iOS: iosInit,
      ),
    );

    // create Android channels
    final androidPM = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    const downloadChannel = AndroidNotificationChannel(
      _downloadChannelId,
      'Downloads',
      description: 'Progress updates for file downloads',
      importance: Importance.low,
      showBadge: false,
    );
    const pushChannel = AndroidNotificationChannel(
      _pushChannelId,
      'Push Messages',
      description: 'Incoming push notifications',
      importance: Importance.high,
    );

    await androidPM?.createNotificationChannel(downloadChannel);
    await androidPM?.createNotificationChannel(pushChannel);
  }

  /// Show a notification
  ///
  Future<void> showDownloadNotification({
    required int id,
    required String title,
    required String body,
    int progress = 0,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      _downloadChannelId,
      'Downloads',
      channelDescription: 'Progress updates for file downloads',
      importance: Importance.low,
      priority: Priority.low,
      onlyAlertOnce: true,
      showProgress: true,
      // maxProgress: 100,
      // progress: progress,
      indeterminate: true,
    );

    const details = NotificationDetails(android: androidDetails);
    await _plugin.show(id, title, body, details);
  }

  /// Show a push notification
  ///
  Future<void> showPushNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      _pushChannelId,
      'Push Messages',
      channelDescription: 'Incoming push notifications',
      importance: Importance.high,
      priority: Priority.high,
    );
    const details = NotificationDetails(android: androidDetails);
    await _plugin.show(id, title, body, details);
  }

  /// Request permissions for iOS and Android
  ///
  Future<void> requestPermissions() async {
    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    await _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  /// Cancel a notification
  ///
  Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id);
  }
}
