import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

FirebaseOptions firebaseOptions = Platform.isAndroid
    ? const FirebaseOptions(
        apiKey: 'AIzaSyCLtjPL3AW33AZnbzDMQZkaOMjvfLYym08',
        appId: '1:892913698510:android:d729e25ed990f73e8fb29f',
        messagingSenderId: '892913698510',
        projectId: 'sepatuflutter')
    : const FirebaseOptions(
        apiKey: 'AIzaSyBfoVDkpxEw30eX0SPWZPWLrvfFSq0c2Ps',
        appId: '1:892913698510:ios:46f83a481ddb95c08fb29f',
        messagingSenderId: '892913698510',
        projectId: 'sepatuflutter');