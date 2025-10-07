import 'dart:io';

import 'package:flutter/material.dart';

class EvidenceGallery extends StatelessWidget {
  const EvidenceGallery({super.key, required this.paths, this.onRemove});

  final List<String> paths;
  final ValueChanged<String>? onRemove;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (final p in paths)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: 88,
                      height: 88,
                      color: const Color(0xFFF0F3F6),
                      child: _thumbForPath(p),
                    ),
                  ),
                  if (onRemove != null)
                    Positioned(
                      top: -6,
                      right: -6,
                      child: Material(
                        color: Colors.black.withValues(alpha: .65),
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () => onRemove!(p),
                          customBorder: const CircleBorder(),
                          child: const Padding(
                            padding: EdgeInsets.all(2),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _thumbForPath(String p) {
    try {
      final file = File(p);
      return Image.file(
        file,
        width: 88,
        height: 88,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _fallbackThumb(p),
      );
    } catch (_) {
      return _fallbackThumb(p);
    }
  }

  Widget _fallbackThumb(String p) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          p.split('/').last,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10, color: Colors.black54),
        ),
      ),
    );
  }
}
