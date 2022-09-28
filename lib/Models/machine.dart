import 'package:testo/Models/hard_to_reach.dart';

class Machine {
  Machine(this._machineName, this._hardToReach);

  String _machineName;
  List<HtoReach> _hardToReach;

  get machineName => _machineName;
  set machineName(name) => _machineName = name;
  get hardToReach => _hardToReach;
  set hardToReach(places) => _hardToReach = places;

}