# L01 Linux service runbook — taskflow

> Finish each TODO(L01) in your own words. Keep evidence concise; do not paste secrets.

## 1. My machine and prerequisites

- TODO(L01): Work Ubuntu or home WSL2 Ubuntu? Ubuntu version / `uname -a`?
- TODO(L01): Java version and `./mvnw verify` result?
- TODO(L01): `ps -p 1 -o comm=` output? Any WSL setup needed?

## 2. What each service setting means

- TODO(L01): Why is `User=` not root?
- TODO(L01): What does `WorkingDirectory=` control?
- TODO(L01): Why use an absolute path in `ExecStart=`?
- TODO(L01): What does `Restart=` do? What does it NOT do?

## 3. Install and verification evidence

- TODO(L01): Document permissions on `/opt/taskflow` and the jar.
- TODO(L01): `systemctl is-active taskflow.service` and `is-enabled` outputs.
- TODO(L01): `curl -fsS http://localhost:8080/actuator/health` output.
- TODO(L01): Relevant `journalctl -u taskflow.service` log excerpt (no secrets).

## 4. Failure investigation

- Symptom / exact error: TODO(L01)
- What I checked: TODO(L01)
- Root cause: TODO(L01)
- Fix and verification: TODO(L01)
- What I will remember next time: TODO(L01)

## 5. Controlled failure/restart

- TODO(L01): What happened to `MainPID` before vs after a forced crash?
- TODO(L01): Why did `systemd` restart it, and why would `systemctl stop` behave differently?

## 6. Cleanup / handoff

- TODO(L01): Did you stop/disable the service after the lab, or leave it on your personal machine?
- TODO(L01): Which commands prove no unintended process remains?
