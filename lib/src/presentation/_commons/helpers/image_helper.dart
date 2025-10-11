import 'dart:async';

import 'package:video_player/video_player.dart';

import '../../../../injection_container.dart';
import '../../../infrastructure/_commons/network/user_session.dart';

Future<String> getFullImageUrl(String imagePath) async {
  try {
    // Récupérer les paramètres de l'organisation et le token
    final userSession = sl<UserSession>();
    final orgSettings = await userSession.getOrganizationSettings();
    final String? authToken = await userSession.getAuthToken();
    // Construire l'URL complète
    final String fullUrl = imagePath.contains('http')
        ? imagePath
        : '${orgSettings!.baseUrl}/api/minio/storage/$imagePath'
              '${authToken != null ? '?token=$authToken' : ''}';

    // Déterminer l'extension du fichier
    return fullUrl;
  } catch (e) {
    // En cas d'erreur, retourner une chaîne vide ou une URL par défaut
    return '';
  }
}

String resolveVideoThumbnail(String url) {
  try {
    final lower = url.trim();
    // If it's clearly an image, return directly
    if (lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.png') ||
        lower.endsWith('.webp')) {
      return url;
    }

    // YouTube patterns
    // 1) https://www.youtube.com/watch?v=VIDEO_ID
    final watchMatch = RegExp(
      r'youtube\.com\/watch\?v=([\w-]{11})',
    ).firstMatch(lower);
    if (watchMatch != null) {
      final id = watchMatch.group(1)!;
      return 'https://img.youtube.com/vi/$id/hqdefault.jpg';
    }

    // 2) https://youtu.be/VIDEO_ID
    final shortMatch = RegExp(r'youtu\.be\/([\w-]{11})').firstMatch(lower);
    if (shortMatch != null) {
      final id = shortMatch.group(1)!;
      return 'https://img.youtube.com/vi/$id/hqdefault.jpg';
    }

    // 3) https://www.youtube.com/embed/VIDEO_ID
    final embedMatch = RegExp(
      r'youtube\.com\/embed\/([\w-]{11})',
    ).firstMatch(lower);
    if (embedMatch != null) {
      final id = embedMatch.group(1)!;
      return 'https://img.youtube.com/vi/$id/hqdefault.jpg';
    }

    // 4) https://www.youtube.com/shorts/VIDEO_ID
    final shortsMatch = RegExp(
      r'youtube\.com\/shorts\/([\w-]{11})',
    ).firstMatch(lower);
    if (shortsMatch != null) {
      final id = shortsMatch.group(1)!;
      return 'https://img.youtube.com/vi/$id/hqdefault.jpg';
    }

    // Unknown or other provider -> return original (may still be a valid image URL)
    return url;
  } catch (_) {
    return url;
  }
}

// --------------------------- video duration helpers -------------------------

final Map<String, Duration> _videoDurationCache = <String, Duration>{};

/// Convert a [Duration] into a human video timecode:
/// - mm:ss when < 1 hour
/// - hh:mm:ss when >= 1 hour and < 1 day
/// - Xj hh:mm:ss when >= 1 day (j = jours)
String formatDurationMmSs(Duration d) {
  if (d.isNegative) d = d.abs();
  final totalSeconds = d.inSeconds;
  final seconds = totalSeconds % 60;
  final totalMinutes = totalSeconds ~/ 60;
  final minutes = totalMinutes % 60;
  final totalHours = totalMinutes ~/ 60;
  final hours = totalHours % 24;
  final days = totalHours ~/ 24;

  if (days > 0) {
    return '${days}j ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
  if (totalHours > 0) {
    return '${totalHours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
  return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

/// Try to get the duration of a network video without playing it.
/// Note: This works for direct media URLs (mp4/m3u8/etc). YouTube page URLs
/// are not direct streams and generally won't initialize without an extractor.
Future<Duration?> _probeVideoDuration(String url, {Duration? timeout}) async {
  VideoPlayerController? controller;
  try {
    controller = VideoPlayerController.networkUrl(Uri.parse(url));
    final fut = controller.initialize();
    if (timeout != null) {
      await fut.timeout(timeout);
    } else {
      await fut;
    }
    return controller.value.duration;
  } catch (_) {
    return null;
  } finally {
    try {
      await controller?.dispose();
    } catch (_) {}
  }
}

/// Get a `mm:ss` duration label for a video URL.
/// Returns '00:00' when duration cannot be determined.
Future<String> getVideoDurationLabel(
  String url, {
  Duration timeout = const Duration(seconds: 6),
}) async {
  try {
    // Serve from cache if available
    final cached = _videoDurationCache[url];
    if (cached != null) {
      return formatDurationMmSs(cached);
    }

    final dur = await _probeVideoDuration(url, timeout: timeout);
    if (dur == null || dur == Duration.zero) {
      return '00:00';
    }
    _videoDurationCache[url] = dur;
    return formatDurationMmSs(dur);
  } catch (_) {
    return '00:00';
  }
}
