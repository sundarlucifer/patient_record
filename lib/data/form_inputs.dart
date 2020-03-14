import 'package:patient_record/models/form_field.dart';
import 'package:patient_record/widgets/custom_input.dart';

List<CustomFormField> formFields = [
  CustomFormField('Patient name', FieldSize.small),
  CustomFormField('Address', FieldSize.medium),
  CustomFormField('Contact number', FieldSize.small),
  CustomFormField('Provisional diagnosis', FieldSize.medium),
  CustomFormField('Investigations (if any)', FieldSize.medium),
  CustomFormField('Final Diagnosis', FieldSize.small),
  CustomFormField('Treatment', FieldSize.medium),
  CustomFormField('Additional information (if any)', FieldSize.medium),
];

List<String> results = [
  'Cured', 'Same condition', 'Referred', 'Expired',
];
