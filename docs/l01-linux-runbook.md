# L01 Linux service runbook — taskflow

> Finish each TODO(L01) in your own words. Keep evidence concise; do not paste secrets.

## 1. My machine and prerequisites

- TODO(L01): Work Ubuntu or home WSL2 Ubuntu? Ubuntu version / `uname -a`? Work Ubuntu. Ubuntu version: 24.04.1-Ubuntu
- TODO(L01): Java version and `./mvnw verify` result? Java version: 27. .```./mvnw verfiy``` result: Build success.
- TODO(L01): `ps -p 1 -o comm=` output? Any WSL setup needed? systemd

## 2. What each service setting means

- TODO(L01): Why is `User=` not root? Because root has the highest priviliege, apply to an compromisable application will be very risky to the system
- TODO(L01): What does `WorkingDirectory=` control? WorkingDirectory control the application is working
- TODO(L01): Why use an absolute path in `ExecStart=`? To avoid ambiguity if the system have multiple execution path for the same application
- TODO(L01): What does `Restart=` do? What does it NOT do? Restart tells systemd when to restart the service and how it should do that. I does not restart the service if the command "systemctl stop" run instead of a SIGKILL or SIGTERM

## 3. Install and verification evidence

- TODO(L01): Document permissions on `/opt/taskflow` and the jar.
drwxr-x--- taskflow taskflow taskflow
-rw-r----- taskflow taskflow taskflow.jar

- TODO(L01): `systemctl is-active taskflow.service` and `is-enabled` outputs.
enabled
active
- TODO(L01): `curl -fsS http://localhost:8080/actuator/health` output.
{"groups":["liveness","readiness"],"status":"UP"}
- TODO(L01): Relevant `journalctl -u taskflow.service` log excerpt (no secrets).
MainPID=54532
active
Nov 23 13:39:25 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 12.
Nov 23 13:39:25 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:25 runhn-03023.runsystemhn.local (java)[52927]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:25 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:25 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:28 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 13.
Nov 23 13:39:28 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:28 runhn-03023.runsystemhn.local (java)[52941]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:28 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:28 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:31 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 14.
Nov 23 13:39:31 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:31 runhn-03023.runsystemhn.local (java)[52943]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:31 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:31 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:35 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 15.
Nov 23 13:39:35 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:35 runhn-03023.runsystemhn.local (java)[53651]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:35 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:35 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:38 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 16.
Nov 23 13:39:38 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:38 runhn-03023.runsystemhn.local (java)[53653]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:38 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:38 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:41 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 17.
Nov 23 13:39:41 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:41 runhn-03023.runsystemhn.local (java)[53655]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:41 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:41 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:42 runhn-03023.runsystemhn.local systemd[1]: Stopped taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:42 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:42 runhn-03023.runsystemhn.local (java)[53662]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:42 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:42 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:45 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 18.
Nov 23 13:39:45 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:45 runhn-03023.runsystemhn.local (java)[53664]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:45 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:45 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:48 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 19.
Nov 23 13:39:48 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:48 runhn-03023.runsystemhn.local (java)[53667]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:48 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:48 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:52 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 20.
Nov 23 13:39:52 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:52 runhn-03023.runsystemhn.local (java)[53676]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:52 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:52 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:55 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 21.
Nov 23 13:39:55 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:55 runhn-03023.runsystemhn.local (java)[53680]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:55 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:55 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:39:58 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 22.
Nov 23 13:39:58 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:39:58 runhn-03023.runsystemhn.local (java)[53703]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:39:58 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:39:58 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:01 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 23.
Nov 23 13:40:01 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:01 runhn-03023.runsystemhn.local (java)[53706]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:01 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:01 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:04 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 24.
Nov 23 13:40:04 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:04 runhn-03023.runsystemhn.local (java)[53726]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:04 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:04 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:08 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 25.
Nov 23 13:40:08 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:08 runhn-03023.runsystemhn.local (java)[54444]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:08 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:08 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:11 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 26.
Nov 23 13:40:11 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:11 runhn-03023.runsystemhn.local (java)[54463]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:11 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:11 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:14 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 27.
Nov 23 13:40:14 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:14 runhn-03023.runsystemhn.local (java)[54465]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:14 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:14 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:17 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 28.
Nov 23 13:40:17 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:17 runhn-03023.runsystemhn.local (java)[54467]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:17 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:17 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:20 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 29.
Nov 23 13:40:20 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:20 runhn-03023.runsystemhn.local (java)[54469]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:20 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:20 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:24 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 30.
Nov 23 13:40:24 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:24 runhn-03023.runsystemhn.local (java)[54479]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:24 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:24 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:27 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 31.
Nov 23 13:40:27 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:27 runhn-03023.runsystemhn.local (java)[54495]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:27 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:27 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:30 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 32.
Nov 23 13:40:30 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:30 runhn-03023.runsystemhn.local (java)[54502]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:30 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:30 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:33 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 33.
Nov 23 13:40:33 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:33 runhn-03023.runsystemhn.local (java)[54505]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:33 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:33 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:37 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 34.
Nov 23 13:40:37 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:37 runhn-03023.runsystemhn.local (java)[54508]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:37 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:37 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:40 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 35.
Nov 23 13:40:40 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:40 runhn-03023.runsystemhn.local (java)[54510]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:40 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:40 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:43 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 36.
Nov 23 13:40:43 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:43 runhn-03023.runsystemhn.local (java)[54512]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:43 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:43 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:46 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 37.
Nov 23 13:40:46 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:46 runhn-03023.runsystemhn.local (java)[54514]: taskflow.service: Changing to the requested working directory failed: No such file or directory
Nov 23 13:40:46 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=exited, status=200/CHDIR
Nov 23 13:40:46 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'exit-code'.
Nov 23 13:40:50 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 38.
Nov 23 13:40:50 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:40:50 runhn-03023.runsystemhn.local java[54532]:   .   ____          _            __ _ _
Nov 23 13:40:50 runhn-03023.runsystemhn.local java[54532]:  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
Nov 23 13:40:50 runhn-03023.runsystemhn.local java[54532]: ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
Nov 23 13:40:50 runhn-03023.runsystemhn.local java[54532]:  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
Nov 23 13:40:50 runhn-03023.runsystemhn.local java[54532]:   '  |____| .__|_| |_|_| |_\__, | / / / /
Nov 23 13:40:50 runhn-03023.runsystemhn.local java[54532]:  =========|_|==============|___/=/_/_/_/
Nov 23 13:40:50 runhn-03023.runsystemhn.local java[54532]:  :: Spring Boot ::                (v4.1.2)
Nov 23 13:40:50 runhn-03023.runsystemhn.local java[54532]: 2026-11-23T13:40:50.697+07:00  INFO 54532 --- [taskflow] [           main] i.g.t.taskflow.TaskflowApplication       : Starting TaskflowApplication v0.0.1-SNAPSHOT using Java 27 with PID 54532 (/opt/taskflow/taskflow.jar started by taskflow in /opt/taskflow)
Nov 23 13:40:50 runhn-03023.runsystemhn.local java[54532]: 2026-11-23T13:40:50.699+07:00  INFO 54532 --- [taskflow] [           main] i.g.t.taskflow.TaskflowApplication       : No active profile set, falling back to 1 default profile: "default"
Nov 23 13:40:51 runhn-03023.runsystemhn.local java[54532]: 2026-11-23T13:40:51.323+07:00  INFO 54532 --- [taskflow] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat initialized with port 8080 (http)
Nov 23 13:40:51 runhn-03023.runsystemhn.local java[54532]: 2026-11-23T13:40:51.331+07:00  INFO 54532 --- [taskflow] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
Nov 23 13:40:51 runhn-03023.runsystemhn.local java[54532]: 2026-11-23T13:40:51.331+07:00  INFO 54532 --- [taskflow] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/11.0.27]
Nov 23 13:40:51 runhn-03023.runsystemhn.local java[54532]: 2026-11-23T13:40:51.345+07:00  INFO 54532 --- [taskflow] [           main] b.w.c.s.WebApplicationContextInitializer : Root WebApplicationContext: initialization completed in 611 ms
Nov 23 13:40:51 runhn-03023.runsystemhn.local java[54532]: 2026-11-23T13:40:51.671+07:00  INFO 54532 --- [taskflow] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
Nov 23 13:40:51 runhn-03023.runsystemhn.local java[54532]: 2026-11-23T13:40:51.705+07:00  INFO 54532 --- [taskflow] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat started on port 8080 (http) with context path '/'
Nov 23 13:40:51 runhn-03023.runsystemhn.local java[54532]: 2026-11-23T13:40:51.710+07:00  INFO 54532 --- [taskflow] [           main] i.g.t.taskflow.TaskflowApplication       : Started TaskflowApplication in 1.251 seconds (process running for 1.518)
Nov 23 13:41:18 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Sent signal SIGKILL to main process 54532 (java) on client request.
Nov 23 13:41:18 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Main process exited, code=killed, status=9/KILL
Nov 23 13:41:18 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Failed with result 'signal'.
Nov 23 13:41:18 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Consumed 6.137s CPU time, 234.1M memory peak, 0B memory swap peak.
Nov 23 13:41:21 runhn-03023.runsystemhn.local systemd[1]: taskflow.service: Scheduled restart job, restart counter is at 39.
Nov 23 13:41:21 runhn-03023.runsystemhn.local systemd[1]: Started taskflow.service - taskflow Spring Boot API (L01).
Nov 23 13:41:21 runhn-03023.runsystemhn.local java[54657]:   .   ____          _            __ _ _
Nov 23 13:41:21 runhn-03023.runsystemhn.local java[54657]:  /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
Nov 23 13:41:21 runhn-03023.runsystemhn.local java[54657]: ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
Nov 23 13:41:21 runhn-03023.runsystemhn.local java[54657]:  \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
Nov 23 13:41:21 runhn-03023.runsystemhn.local java[54657]:   '  |____| .__|_| |_|_| |_\__, | / / / /
Nov 23 13:41:21 runhn-03023.runsystemhn.local java[54657]:  =========|_|==============|___/=/_/_/_/
Nov 23 13:41:21 runhn-03023.runsystemhn.local java[54657]:  :: Spring Boot ::                (v4.1.2)
Nov 23 13:41:21 runhn-03023.runsystemhn.local java[54657]: 2026-11-23T13:41:21.931+07:00  INFO 54657 --- [taskflow] [           main] i.g.t.taskflow.TaskflowApplication       : Starting TaskflowApplication v0.0.1-SNAPSHOT using Java 27 with PID 54657 (/opt/taskflow/taskflow.jar started by taskflow in /opt/taskflow)
Nov 23 13:41:21 runhn-03023.runsystemhn.local java[54657]: 2026-11-23T13:41:21.934+07:00  INFO 54657 --- [taskflow] [           main] i.g.t.taskflow.TaskflowApplication       : No active profile set, falling back to 1 default profile: "default"
Nov 23 13:41:22 runhn-03023.runsystemhn.local java[54657]: 2026-11-23T13:41:22.529+07:00  INFO 54657 --- [taskflow] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat initialized with port 8080 (http)
Nov 23 13:41:22 runhn-03023.runsystemhn.local java[54657]: 2026-11-23T13:41:22.536+07:00  INFO 54657 --- [taskflow] [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
Nov 23 13:41:22 runhn-03023.runsystemhn.local java[54657]: 2026-11-23T13:41:22.536+07:00  INFO 54657 --- [taskflow] [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/11.0.27]
Nov 23 13:41:22 runhn-03023.runsystemhn.local java[54657]: 2026-11-23T13:41:22.548+07:00  INFO 54657 --- [taskflow] [           main] b.w.c.s.WebApplicationContextInitializer : Root WebApplicationContext: initialization completed in 583 ms
Nov 23 13:41:22 runhn-03023.runsystemhn.local java[54657]: 2026-11-23T13:41:22.862+07:00  INFO 54657 --- [taskflow] [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 1 endpoint beneath base path '/actuator'
Nov 23 13:41:22 runhn-03023.runsystemhn.local java[54657]: 2026-11-23T13:41:22.901+07:00  INFO 54657 --- [taskflow] [           main] o.s.boot.tomcat.TomcatWebServer          : Tomcat started on port 8080 (http) with context path '/'
Nov 23 13:41:22 runhn-03023.runsystemhn.local java[54657]: 2026-11-23T13:41:22.906+07:00  INFO 54657 --- [taskflow] [           main] i.g.t.taskflow.TaskflowApplication       : Started TaskflowApplication in 1.209 seconds (process running for 1.464)
{"groups":["liveness","readiness"],"status":"UP"}
## 4. Failure investigation

- Symptom / exact error: taskflow.service is enabled but cannot active
- What I checked: journalctl for logging the activity when try to active the service
- Root cause: Wrong ExecStart. Only the /usr/bin/java without the args -jar and the absolute path of the jar file
- Fix and verification: Add the argument and the absolute of the jar file, copy it again, reload the daemon and verify using systemctl-analyze verify
- What I will remember next time: Verify the service file again to make sure the info inside is correct

## 5. Controlled failure/restart

- TODO(L01): What happened to `MainPID` before vs after a forced crash?
They are diffenret from each other, after the crash, the MainPID is larger than before the crash
- TODO(L01): Why did `systemd` restart it, and why would `systemctl stop` behave differently?
Because I set Restart=on-failure, and SIGKILL is the signal for failure, peacefully. systemctl stop is when I actively want it to stop, not a crash or failure, so the systemd will not restart it
## 6. Cleanup / handoff

- TODO(L01): Did you stop/disable the service after the lab, or leave it on your personal machine? Yes I did
- TODO(L01): Which commands prove no unintended process remains? is-active and is-enabled proves it. They said failed and not-found
