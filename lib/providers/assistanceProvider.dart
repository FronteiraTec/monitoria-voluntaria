import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../models/assistanceModel.dart';

import '../helpers/httpHelper.dart';

class AssistanceProvider with ChangeNotifier {
  static const _baseUrl = "131.108.55.50:3000";
  static const _limit = 15;
  List<Assistance> _items = [];

  final http = HttpHelper(_baseUrl);

  Future<void> fetchAssistances(BuildContext context, int offset) async {
    final res = await http.get("/assistance",
        {"offset": offset.toString(), "limit": _limit.toString()});

    final assistancesJson = res["body"] as List;
    
    
    final assistanceList = assistancesJson.map((assistance) {
        return Assistance.parseFromMap(assistance["assistance"]);
    }).toList();


    _items = _items + assistanceList;
    notifyListeners();

  }

  void clear() {
    _items = [];
  }

  List<Assistance> get items {
    return [..._items];
  }
}
