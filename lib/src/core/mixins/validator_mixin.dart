mixin ValidatorMixin {
  String? requiredField(String? value) {
    if (value != null && value.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }
}
