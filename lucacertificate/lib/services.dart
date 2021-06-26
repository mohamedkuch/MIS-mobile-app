import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lucacertificate/models/certificate.dart';
import 'package:lucacertificate/models/machine.dart';
import 'package:lucacertificate/models/user.dart';
import 'package:lucacertificate/models/workplace.dart';

class Services {
  static Future login(rNumber, lastName) async {
    try {
      final res = await http.post(
        Uri.parse('https://nameless-ocean-84519.herokuapp.com/login'),
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
      return {'error': "error sending request" + e.toString()};
    }
  }

  static Future getCertificates(rNumber, token) async {
    try {
      var buildUrl = "https://nameless-ocean-84519.herokuapp.com/students/" +
          rNumber +
          "/certificates?token=" +
          token;
      final res = await http.get(
        Uri.parse(buildUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        final List<Certificate> certificateList = certificateFromJson(res.body);

        return {
          'data': certificateList,
          'message': "certificates fetched successfully"
        };
      }
      return {'error': res.body};
    } catch (e) {
      return {'error': "error sending request"};
    }
  }

  static Future getScannedMachine(id, token) async {
    try {
      var buildUrl = "https://nameless-ocean-84519.herokuapp.com/machines/" +
          id +
          "?token=" +
          token;
      final res = await http.get(
        Uri.parse(buildUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        final Machine machine = machineFromJson(res.body);

        return {'data': machine, 'message': "machine scanned successfully"};
      }
      return {'error': res.body};
    } catch (e) {
      return {'error': "error sending request"};
    }
  }

  static Future getMachines(token) async {
    try {
      var buildUrl = "https://nameless-ocean-84519.herokuapp.com/machines/" +
          "?token=" +
          token;
      final res = await http.get(
        Uri.parse(buildUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        final List<Machine> machineList = machineListFromJson(res.body);

        return {
          'data': machineList,
          'message': "machine list fetched successfully"
        };
      }
      return {'error': res.body};
    } catch (e) {
      return {'error': "error sending request"};
    }
  }

  static Future postUseMachine(machineID, rNumber, token) async {
    try {
      var buildUrl = 'https://nameless-ocean-84519.herokuapp.com/machines/' +
          machineID +
          '/use/' +
          rNumber +
          '?token=' +
          token;
      final res = await http.post(
        Uri.parse(buildUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return {'message': "user posted use of Machine  successfully"};
      }
      return {'error': res.body};
    } catch (e) {
      return {'error': "error sending request"};
    }
  }

  static Future getScannedWorkplace(id, token) async {
    try {
      var buildUrl = "https://nameless-ocean-84519.herokuapp.com/workplaces/" +
          id +
          "?token=" +
          token;
      final res = await http.get(
        Uri.parse(buildUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        final Workplace workplace = workplaceFromJson(res.body);

        return {'data': workplace, 'message': "workplace scanned successfully"};
      }
      return {'error': res.body};
    } catch (e) {
      return {'error': "error sending request"};
    }
  }

  static Future postEnterWorkplace(workplaceId, rNumber, token) async {
    try {
      var buildUrl = 'https://nameless-ocean-84519.herokuapp.com/workplaces/' +
          workplaceId +
          '/enter/' +
          rNumber +
          '?token=' +
          token;
      final res = await http.post(
        Uri.parse(buildUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return {'message': "user posted use of Workplace  successfully"};
      }
      return {'error': res.body};
    } catch (e) {
      return {'error': "error sending request"};
    }
  }
}
