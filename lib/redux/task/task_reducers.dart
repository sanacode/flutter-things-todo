import 'package:redux/redux.dart';

import 'package:thingstodo/data/model/models.dart';

import 'task_actions.dart';
import 'task_state.dart';

final taskReducers = combineReducers<TaskState>([
  TypedReducer<TaskState, CreateTaskAction>(createTaskAction),
  TypedReducer<TaskState, UpdateTaskAction>(updateTaskAction),
  TypedReducer<TaskState, RemoveTaskAction>(removeTaskAction)
]);

TaskState createTaskAction(TaskState state, CreateTaskAction action) {
  return state.rebuild((b) => b
    ..tasks.add(action.task)
  );
}

TaskState updateTaskAction(TaskState state, UpdateTaskAction action) {
  state.rebuild((b) => b
    ..tasks.where((TaskModel task) {
        return task.taskId == action.task.taskId;
    })
  );

  return state;
}

TaskState removeTaskAction(TaskState state, RemoveTaskAction action) {
  return state.rebuild((b) => b
    ..tasks.removeWhere((TaskModel task) {
      return task.taskId == action.task.taskId;
    })
  );
}
