package io.github.thanhlee2112.taskflow.task;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import org.junit.jupiter.api.Test;

/** Plain unit test: no Spring context, runs in milliseconds. */
class TaskServiceTest {

    private final TaskService service = new TaskService();

    @Test
    void createAssignsIncreasingIdsAndStartsNotDone() {
        Task first = service.create("Install WSL");
        Task second = service.create("  Install Docker Desktop  ");

        assertThat(first.id()).isEqualTo(1);
        assertThat(second.id()).isEqualTo(2);
        assertThat(second.title()).isEqualTo("Install Docker Desktop");
        assertThat(second.done()).isFalse();
    }

    @Test
    void findAllReturnsTasksInIdOrder() {
        service.create("a");
        service.create("b");
        service.create("c");

        assertThat(service.findAll()).extracting(Task::title).containsExactly("a", "b", "c");
    }

    @Test
    void blankTitleIsRejected() {
        assertThatThrownBy(() -> service.create("   "))
                .isInstanceOf(IllegalArgumentException.class)
                .hasMessageContaining("blank");
    }
}
