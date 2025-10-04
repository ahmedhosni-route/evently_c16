import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/models/event_model.dart';

class EventServices {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static CollectionReference<EventModel> _getEventRef() {
    return _firestore.collection("event").withConverter(
      fromFirestore: (snapshot, options) {
        return EventModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
  }

  static Future<void> addEvent(EventModel event) async {
    var ref = _getEventRef();
    var doc = ref.doc();
    event.id = doc.id;
    return doc.set(event);
  }
}
