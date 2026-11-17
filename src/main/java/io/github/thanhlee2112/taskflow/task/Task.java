package io.github.thanhlee2112.taskflow.task;

/** A to-do item. Immutable; the service replaces it when something changes. */
public record Task(long id, String title, boolean done) {
}
