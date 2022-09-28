import 'package:testo/Models/machine.dart';

class Dept {
  Dept(this._deptName, this._machines);

  String _deptName;
  List<Machine> _machines;

  get deptName => _deptName;
  set deptName(name) => _deptName = name;
  get machines => _machines;
  set machines(listOfMachines) => _machines = listOfMachines;
}