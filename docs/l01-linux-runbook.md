# L01 Linux service runbook — taskflow

> Finish each TODO(L01) in your own words. Keep evidence concise; do not paste secrets.

## 1. My machine and prerequisites

- TODO(L01): Work Ubuntu or home WSL2 Ubuntu? Ubuntu version / `uname -a`? Work Ubuntu. Ubuntu version: 24.04.1-Ubuntu
- TODO(L01): Java version and `./mvnw verify` result? Java version: 27. .```./mvnw verfiy``` result: Build success.
- TODO(L01): `ps -p 1 -o comm=` output? Any WSL setup needed? systemd

## 2. What each service setting means

- TODO(L01): Why is `User=` not root? Because root has the highest priviliege, apply to an compromisable application will be very risky to the system
- TODO(L01): What does `WorkingDirectory=` control? WorkingDirectory control where the systemd the application is working
- TODO(L01): Why use an absolute path in `ExecStart=`? Because systemd always work on the root directory, so an absolute path is the only way to tell it where to get started
- TODO(L01): What does `Restart=` do? What does it NOT do? Restart tells systemd when to restart the service and how it should do that. I don't know what it does not do

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
The icon of Spring Boot with the server starter logs below
## 4. Failure investigation

- Symptom / exact error: taskflow.service is enabled but cannot active
- What I checked: journalctl for logging the activity when try to active the service
- Root cause: Wrong ExecStart. Only the /usr/bin/java without the args -jar and the absolute path of the jar file
- Fix and verification: Add the argument and the absolute of the jar file, copy it again, reload the daemon and verify using systemctl-analyze verify
- What I will remember next time: Verify the service file again to make sure the info inside is correct

## 5. Controlled failure/restart

- TODO(L01): What happened to `MainPID` before vs after a forced crash? Before the crash, MainPID is a number larger than 0. After it, MainPID = 0
- TODO(L01): Why did `systemd` restart it, and why would `systemctl stop` behave differently? I don't know. All I know is that systemctl stop will stop all the service that is stated on the command line
## 6. Cleanup / handoff

- TODO(L01): Did you stop/disable the service after the lab, or leave it on your personal machine? Yes I did
- TODO(L01): Which commands prove no unintended process remains? is-active and is-enabled proves it. They said failed and not-found
