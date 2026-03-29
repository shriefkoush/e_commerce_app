 import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 class ToastMessage {
   static void customToast(
       BuildContext context,
       String message, {
         Color bg = Colors.green,
       }) {
     final overlay = Overlay.of(context);
     final entry = OverlayEntry(
       builder: (_) => Positioned(
         bottom: 50,
         left: 20,
         right: 20,
         child: Material(
           color: Colors.transparent,
           child: AnimatedContainer(
             duration: const Duration(milliseconds: 300),
             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
             decoration: BoxDecoration(
               color: bg,
               borderRadius: BorderRadius.circular(12),
             ),
             child: Row(
               children: [
                 const Icon(Icons.check_circle, color: Colors.white),
                 const SizedBox(width: 12),
                 Expanded(
                   child: Text(
                     message,
                     style: const TextStyle(color: Colors.white, fontSize: 15),
                   ),
                 ),
               ],
             ),
           ),
         ),
       ),
     );

     overlay.insert(entry);
     Future.delayed(const Duration(seconds: 3), () => entry.remove());
   }
 }