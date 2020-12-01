import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

T cubit<T extends Cubit>(BuildContext context) => BlocProvider.of<T>(context);
