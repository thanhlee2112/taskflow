#!/usr/bin/env bash
# Checks that your workstation is ready for the DevOps course (L00).
# Run it from the repo root:   ./scripts/check-env.sh
# Exit code 0 = everything required is OK, 1 = something needs fixing.
# (You will write scripts like this yourself in L02.)
set -euo pipefail

cd "$(dirname "$0")/.."

pass=0 warn=0 fail=0
ok()   { printf '  [ OK ] %s\n' "$1"; pass=$((pass + 1)); }
note() { printf '  [WARN] %s\n         hint: %s\n' "$1" "$2"; warn=$((warn + 1)); }
bad()  { printf '  [FAIL] %s\n         fix:  %s\n' "$1" "$2"; fail=$((fail + 1)); }
has()  { command -v "$1" >/dev/null 2>&1; }

echo "taskflow workstation check"
echo

echo "Linux side"
if grep -qi microsoft /proc/version 2>/dev/null; then
  ok "running inside WSL (kernel $(uname -r))"
else
  note "not WSL (fine for Codespaces or a Linux VM)" "on Windows, run this inside the Ubuntu (WSL) terminal"
fi

case "$PWD" in
/mnt/*) bad "repo is on the Windows drive: $PWD" "move it into Linux: mv \"$PWD\" ~/taskflow && cd ~/taskflow" ;;
*) ok "repo lives on the Linux filesystem ($PWD)" ;;
esac

for tool in curl unzip; do
  if has "$tool"; then ok "$tool installed"; else bad "$tool missing" "sudo apt install -y $tool"; fi
done

echo
echo "Java"
if has javac; then
  version_line="$(javac -version 2>&1 | grep '^javac' || true)"
  version="${version_line#javac }"
  major="${version%%.*}"
  if [[ "$major" =~ ^[0-9]+$ ]] && ((major >= 25)); then
    ok "JDK $version"
  else
    bad "JDK is '${version:-unknown}', need 25+" "sudo apt install -y openjdk-25-jdk && sudo update-alternatives --config java"
  fi
else
  bad "javac not found (a JRE is not enough, you need the JDK)" "sudo apt install -y openjdk-25-jdk"
fi

if [[ -n "${JAVA_HOME:-}" && -x "${JAVA_HOME}/bin/javac" ]]; then
  ok "JAVA_HOME=$JAVA_HOME"
else
  note "JAVA_HOME not set (mvnw still works if java is on PATH)" "see L00 lab step 3, e.g. add to ~/.bashrc: export JAVA_HOME=/usr/lib/jvm/java-25-openjdk-amd64"
fi

echo
echo "Build"
if [[ -x mvnw ]]; then ok "mvnw is executable"; else bad "mvnw is not executable" "chmod +x mvnw && git update-index --chmod=+x mvnw"; fi
if grep -q $'\r' mvnw; then
  bad "mvnw has Windows (CRLF) line endings" "sed -i 's/\\r\$//' mvnw   (and keep .gitattributes in the repo)"
else
  ok "mvnw has Unix (LF) line endings"
fi

echo
echo "Git and GitHub"
if has git; then
  ok "$(git --version)"
  name="$(git config --global user.name || true)"
  email="$(git config --global user.email || true)"
  if [[ -n "$name" && -n "$email" ]]; then ok "git identity: $name <$email>"; else bad "git user.name / user.email not set" "git config --global user.name \"Your Name\" && git config --global user.email you@example.com"; fi
  autocrlf="$(git config --global core.autocrlf || true)"
  if [[ "$autocrlf" == "true" ]]; then note "core.autocrlf=true converts files to CRLF" "git config --global core.autocrlf input"; else ok "core.autocrlf=${autocrlf:-unset}"; fi
else
  bad "git missing" "sudo apt install -y git"
fi

ssh_out="$(ssh -T -o BatchMode=yes -o ConnectTimeout=8 -o StrictHostKeyChecking=accept-new git@github.com 2>&1 || true)"
if [[ "$ssh_out" == *"successfully authenticated"* ]]; then
  ok "GitHub SSH: ${ssh_out%%!*}"
else
  bad "GitHub SSH login failed" "add ~/.ssh/id_ed25519.pub at github.com/settings/keys, then: ssh -T git@github.com"
fi

echo
echo "Docker"
if has docker; then
  if docker info >/dev/null 2>&1; then
    ok "Docker engine reachable (server $(docker version --format '{{.Server.Version}}' 2>/dev/null || echo '?'))"
  else
    bad "docker CLI found but the engine is not reachable" "start Docker Desktop, then Settings > Resources > WSL integration > enable Ubuntu"
  fi
else
  bad "docker not found in this distro" "install Docker Desktop on Windows and enable WSL integration for Ubuntu"
fi

echo
printf 'Result: %d OK, %d warnings, %d failed\n' "$pass" "$warn" "$fail"
if ((fail > 0)); then
  echo "Fix the FAIL lines above, then run this script again."
  exit 1
fi
echo "Workstation ready."
