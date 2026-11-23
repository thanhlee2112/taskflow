# DevOps baseline (L00)

Where taskflow starts. Come back to this file in L36 and compare.

## 1. Toolchain map

for each stage, write the tool taskflow will use in this course and
the lesson that introduces it. The first row is done as an example.

| Stage                  | Tool for taskflow | Lesson |
|------------------------|-------------------|--------|
| Source control         | Git + GitHub      | L00, L04 |
| Build and unit test    | Maven, Gradle, npm; JUnit         |        |
| CI (on every PR)       | GitHub Actions, Jenkins, GitLab CI         |        |
| Package / runtime      | Container (OCI) images, jars         |        |
| Artifact registry      | GHCR, Docker Hub, Amazon ECR, Nexus         |        |
| Infrastructure as code | Terraform/OpenTofu, CloudFormation, Pulumi         |        |
| Cloud                  | AWS, Azure, Google Cloud         |        |
| Orchestration          | Kubernetes, Amazon ECS; Helm         |        |
| Deployment (GitOps)    | Argo CD (GitOps), pipeline deploy jobs         |        |
| Monitoring             | Prometheus, Grafana, Loki, OpenTelemetry, CloudWatch        |        |

## 2. DORA baseline for taskflow today

fill each row for taskflow as it is right now, and say in one line
how you would measure it once a pipeline exists.

| Metric                          | Today     | How I'll measure it later |
|---------------------------------|-----------|---------------------------|
| Change lead time                | not measurable yet | Deploy timestamp minus commit timestamp; report the median                 |
| Deployment frequency            | not measurable yet | Count production deployments per day or week                 |
| Failed deployment recovery time | not measurable yet | Time from the failed deploy to service restored (rollback or fix); median                 |
| Change fail rate                | not measurable yet | Deployments needing a rollback or hotfix ÷ all deployments                 |
| Deployment rework rate          | not measurable yet | Unplanned fix deployments ÷ all deployments                 |

one or two sentences. Which of these will improve first in this
course, and why?
In my opinion, Deployment frequency and Failed deployment recovery time will improve first, as they are the main reason why the term "DevOps" exist.
## 3. My workstation

paste the output of `./scripts/check-env.sh` here (inside a code block).
```
taskflow workstation check

Linux side
  [WARN] not WSL (fine for Codespaces or a Linux VM)
         hint: on Windows, run this inside the Ubuntu (WSL) terminal
  [ OK ] repo lives on the Linux filesystem (/media/thanhlt2/Data/taskflow)
  [ OK ] curl installed
  [ OK ] unzip installed

Java
  [ OK ] JDK 27
  [ OK ] JAVA_HOME=/usr/lib/jvm/jdk-27-oracle-x64

Build
  [ OK ] mvnw is executable
  [ OK ] mvnw has Unix (LF) line endings

Git and GitHub
  [ OK ] git version 2.43.0
  [ OK ] git identity: thanhlt <tatthanh210703@gmail.com>
  [ OK ] core.autocrlf=unset
  [ OK ] GitHub SSH: Hi thanhlee2112

Docker
  [ OK ] Docker engine reachable (server 29.6.2)

Result: 12 OK, 1 warnings, 0 failed
Workstation ready.
```
