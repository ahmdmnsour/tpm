class HtoReach {
  HtoReach(this._placeName, this._blockType, this._removalMethod, this._partiesConcerned);

  String _placeName;
  String _blockType;
  String _removalMethod;
  String _partiesConcerned;

  get placeName => _placeName;
  set placeName(name) => _placeName = name;
  get blockType => _blockType;
  set blockType(type) => _blockType = type;
  get removalMethod => _removalMethod;
  set removalMethod(method) => _removalMethod = method;
  get partiesConcerned => _partiesConcerned;
  set partiesConcerned(parties) => _partiesConcerned = parties;
}