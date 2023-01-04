import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farmgo/blocs/fields%20bloc/bloc/repository.dart';
import 'package:flutter/foundation.dart';

import '../../../models/field.dart';
import 'add_field_state.dart';
import 'fetch_fields_state.dart';

part 'fields_event.dart';
part 'fields_state.dart';

class FieldsBloc extends Bloc<FieldsEvent, FieldsState> {
  FieldsBloc() : super(const FieldsState()) {
    on<AddField>(_addField);
    on<FetchFields>(_fetchField);
  }

  final repo = FieldsRepository();

  _addField(AddField event, Emitter<FieldsState> emit) async {
    emit(state.copyWith(addFieldState: AddFieldLoading()));
    try {
      await repo.addAField(event.field);
      emit(state.copyWith(
        addFieldState: const AddFieldSuccess(message: "Field Added Successfully!")
      ));
      debugPrint('reached');
    } catch (e) {
      emit(const FieldsState(
          addFieldState: AddFieldFailed(message: "Field added successfully!")));
    }
  }

  _fetchField(FetchFields event, Emitter<FieldsState> emit) async {
    emit(state.copyWith(
      fetchFieldsState: FetchFieldsLoading(),
    ));
    try {
      repo.fetchAllFields().listen((info) {
        List json = info.docs;
        List<Field> fields = [];
        for (var element in json) {
          Field field = Field.fromMap(element.data());
          fields.add(field);
        }
        emit(
            state.copyWith(fetchFieldsState: FetchFieldsSuccess(data: fields)));
      });
    } catch (e) {
      emit(
        state.copyWith(
          fetchFieldsState: FetchFieldsFailed(message: e.toString()),
        ),
      );
    }
  }
}
