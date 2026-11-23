# taskflow

A small task API in Java 25 and Spring Boot 4. The app is deliberately simple;
it exists so there is something real to build, containerize, ship through CI/CD,
deploy to AWS with Terraform, run on Kubernetes and monitor. Each lesson of my
DevOps course adds one piece, and the "Learning log" below records the journey.

## Run it

Requires a JDK 25. Maven is not needed: `./mvnw` downloads the pinned version.

```bash
./mvnw verify                # compile, run tests, package target/taskflow-0.0.1-SNAPSHOT.jar
./mvnw spring-boot:run       # start on http://localhost:8080 (Ctrl+C to stop)
```

## API

| Method | Path                | What it does                                   |
|--------|---------------------|------------------------------------------------|
| GET    | `/api/tasks`        | list all tasks                                 |
| GET    | `/api/tasks/{id}`   | one task, or 404                               |
| POST   | `/api/tasks`        | create: `{"title": "..."}` → 201 + `Location`  |
| GET    | `/actuator/health`  | `{"status":"UP"}` when the app is healthy      |

```bash
curl -s -X POST localhost:8080/api/tasks -H 'Content-Type: application/json' -d '{"title":"Learn DevOps"}'
curl -s localhost:8080/api/tasks
```

Data lives in memory and disappears on restart (PostgreSQL arrives in L08).

## Pipeline status

No pipeline yet. CI arrives in L11; this section will get a badge then.

## Learning log

One row per lesson: what I added, and one thing that broke and how I fixed it.

| Lesson | Date | What I added | What broke and how I fixed it |
|--------|------|--------------|-------------------------------|
| L00    | 2026-11-23 | I ran the Maven and the Jar file, along with taskflow check for tool on my computer | The taskflow check failed with one line, because it does not recognize my Docker Desktop. I read it and simply turn Docker Desktop on |
| L01    | 2026-11-23 | I added the service for running .jar file, along with start it and check for its health with crash recovery | The service failed to start because I misconfigured the ExecStart in the service file. I read the log, confirmed the misconfigured and reconfig it, added the service again and started it successfully |

