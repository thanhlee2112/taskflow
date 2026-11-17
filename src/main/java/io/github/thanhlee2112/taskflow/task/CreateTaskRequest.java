package io.github.thanhlee2112.taskflow.task;

/** JSON body for POST /api/tasks, e.g. {"title": "Set up WSL"}. */
public record CreateTaskRequest(String title) {
}
