package app.domain;

import java.time.LocalDate;
import java.util.Locale;

public class Task {
    private Long id;
    private String title;
    private String description;
    private LocalDate deadLineDate;
    private boolean isDone;
    public Task() {
    }

    public Task(Long id, String title, String description, LocalDate deadLineDate, boolean isDone) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.deadLineDate = deadLineDate;
        this.isDone = isDone;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getDeadLineDate() {
        return deadLineDate;
    }

    public void setDeadLineDate(LocalDate deadLineDate) {
        this.deadLineDate = deadLineDate;
    }

    public boolean isDone() {
        return isDone;
    }

    public void setDone(boolean done) {
        isDone = done;
    }


}

