import 'package:flutter/foundation.dart';
import 'package:monitoring/models/assistanceModel.dart';
import 'package:monitoring/models/locationModel.dart';
import 'package:monitoring/models/userModel.dart';
import '../helpers/httpHelper.dart';

class AssistanceProvider with ChangeNotifier {
  static const _baseUrl = "131.108.55.50:3000";
  static const _limit = 15;
  var _items = [];

  final http = HttpHelper(_baseUrl);

  Future<void> fetchAssistances(int offset) async {    
    final res = await http.get("/assistance", {
      "offset": offset.toString(),
      "limit": _limit.toString()
    });

    final assistancesJson = res["body"] as List;

    // Location.parseFromMap(assistance)

    final assistanceList = assistancesJson
        .map(
          (assistance) => Assistance(
            date: DateTime.parse(assistance["assistance_date"]),
            id: assistance["assistance_id"],
            description: assistance["assistance_description"],
            location: Location.parseFromMap(assistance),
            owner: User.parseFromMap(assistance),
            numberParticipants: assistance["assistance_num_participants"],
            title: assistance["assistance_title"],
            createdAt: assistance["assistance_created_at"],
          ),
        )
        .toList();
    
    _items = [..._items] + [...assistanceList];
    notifyListeners();
  }

  void clear(){
    _items = [];
  }


  List<Assistance> get items {
    return [..._items];
  }
}
