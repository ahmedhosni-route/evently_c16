import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c16_online/core/models/event_model.dart';

class LayoutServices {
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

  static Future<QuerySnapshot<EventModel>> getEvents(String id) async {
    var ref = _getEventRef();
    return id == "all"
        ? ref.get()
        : ref.where("categoryId", isEqualTo: id).get();
  }
  static Stream<QuerySnapshot<EventModel>> getEventsStream(String id)  {
    var ref = _getEventRef();
    return id == "all"
        ? ref.snapshots()
        : ref.where("categoryId", isEqualTo: id).snapshots();
  }
  static Stream<QuerySnapshot<EventModel>> getFavStream()  {
    var ref = _getEventRef();
    return  ref.where("isFav", isEqualTo: true).snapshots();
  }

  static toggleFav(EventModel event) async {
    var ref = _getEventRef();
    event.isFav = !event.isFav;
    await ref.doc(event.id).set(event);
  }
}
