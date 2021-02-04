FROM ghcr.io/morten-olsen/work-base:latest
USER root
RUN apt install -y \
  nmap \
  dnsutils \
  whois \
  dirb \
  recon-ng \
  sqlmap \
  wfuzz
USER alice
