import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../models/assistanceModel.dart';

import '../helpers/httpHelper.dart';

enum Status {
  none,
  waiting,
  error,
  done
}

class AssistanceProvider with ChangeNotifier {
  static const _baseUrl = "131.108.55.50:3000";
  static const _limit = 15;
  List<Assistance> _items = [];

  final http = HttpHelper(_baseUrl);

  Future<Status> fetchAssistances(BuildContext context, int offset) async {
    try {
      final res = await http.get("/assistance", {
        "offset": offset.toString(),
        "limit": _limit.toString(),
      });

      final assistancesJson = res["body"] as List;

      final assistanceList = assistancesJson.map((assistance) {
        return Assistance.parseFromMap(assistance["assistance"]);
      }).toList();

      assistanceList.forEach((a) => a.course.cacheImage(context));

      _items = _items + assistanceList;
      notifyListeners();
      
      return Status.done;
    } catch (error) {
      return Status.error;
    }
  }

  void clear() {
    _items = [];
  }

  List<Assistance> get items {
    return [..._items];
  }

  Assistance getById(int id) {
    final assistance = items.firstWhere((a) => a.id == id);

    return assistance is Assistance ? assistance : null;
  }
}
