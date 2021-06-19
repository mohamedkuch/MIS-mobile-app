import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lucacertificate/models/user.dart';

class Services {
  static Future login(rNumber, lastName) async {
    try {
      final res = await http.post(
        Uri.parse('http://localhost:3000/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'rNumber': rNumber,
          'lastName': lastName,
        }),
      );
      if (res.statusCode == 200) {
        final User loggedUser = userFromJson(res.body);

        return {'data': loggedUser, 'message': "user logged in successfully"};
      }
      return {'error': res.body};
    } catch (e) {
      return {'error': "error sending request"};
    }
  }

  // static Future getSearchPosts(pageNumber, searchTerm) async {
  //   var queryParameters = {
  //     'per_page': '5',
  //     '_embed': 'true',
  //     'page': pageNumber.toString(),
  //     'search': searchTerm
  //   };
  //   int count = 0;

  //   try {
  //     final res = await http.get(
  //         Uri.https(
  //             'www.unboxingtn.com', '/wp-json/wp/v2/posts', queryParameters),
  //         headers: {'Accept': 'application/json'});

  //     if (res.statusCode == 200) {
  //       final List<Post> posts = postFromJson(res.body);
  //       for (var item in res.headers.entries) {
  //         if (item.key == 'x-wp-totalpages') {
  //           count = int.parse(item.value);
  //         }
  //       }

  //       return {'posts': posts, 'count': count};
  //     } else {
  //       // ignore: deprecated_member_use
  //       return {'posts': List<Post>(), 'count': count};
  //     }
  //   } catch (e) {
  //     // ignore: deprecated_member_use
  //     return {'posts': List<Post>(), 'count': count};
  //   }
  // }

  // static Future getPosts(pageNumber) async {
  //   var queryParameters = {
  //     'per_page': '5',
  //     '_embed': 'true',
  //     'page': pageNumber.toString(),
  //   };
  //   int count = 0;

  //   try {
  //     final res = await http.get(
  //         Uri.https(
  //             'www.unboxingtn.com', '/wp-json/wp/v2/posts', queryParameters),
  //         headers: {'Accept': 'application/json'});

  //     if (res.statusCode == 200) {
  //       final List<Post> posts = postFromJson(res.body);
  //       for (var item in res.headers.entries) {
  //         if (item.key == 'x-wp-totalpages') {
  //           count = int.parse(item.value);
  //         }
  //       }

  //       return {'posts': posts, 'count': count};
  //     } else {
  //       // ignore: deprecated_member_use
  //       return {'posts': List<Post>(), 'count': count};
  //     }
  //   } catch (e) {
  //     // ignore: deprecated_member_use
  //     return {'posts': List<Post>(), 'count': count};
  //   }
  // }

}
