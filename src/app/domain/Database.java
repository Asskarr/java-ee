package app.domain;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Database {
    private static final List<Task> tasks = new ArrayList<>();
    public static void addTask(String title, String description, LocalDate deadLineDate, boolean isDone) {
        long newTaskId = tasks.size() + 1;
        tasks.add(new Task(newTaskId , title, description, deadLineDate, isDone));

    }
    public static Task getTaskById(Long id){
        for (Task task : tasks) {
            if (Objects.equals(task.getId(),id)) {
                return task;
            }
        }
        return null;
    }
    public static List<Task> getAllTasks(){
        return tasks;
    }
    public static void updateTask(Long id, String title, String description, LocalDate deadLineDate, boolean isDone) {
        int indexOfTask = getIndexByTaskId(id);
        if (indexOfTask == -1)
            return;

        Task updateTask = new Task(id, title, description, deadLineDate, isDone);
        tasks.set(indexOfTask, updateTask);
    }

    public static void deleteTask(Long id) {
        int indexOfTask = getIndexByTaskId(id);
        if (indexOfTask == -1)
            return;

        tasks.remove(indexOfTask);

    }

    public static int getIndexByTaskId(Long id)  {
        for (int i = 0; i < tasks.size(); i++) {
            if (Objects.equals(tasks.get(i).getId(), id)) {
                return i;
            }
        }
        return -1;
    }
}