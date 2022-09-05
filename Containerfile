FROM registry.redhat.io/ubi9/python-39@sha256:6329d5779e89630928d5fa65a7b7b824f6bf41357f5db1688f0efafcbe48b14d

COPY requirements.txt ${APP_ROOT}/etc/radicale/requirements.txt
COPY config ${APP_ROOT}/etc/radicale/config
COPY container-entrypoint ${APP_ROOT}/bin/container-entrypoint

ENV RADICALE_CONFIG ${APP_ROOT}/etc/radicale/config

RUN \
  python3 -m pip install --upgrade pip && \
  mkdir -p $(cat ${RADICALE_CONFIG} | grep filesystem_folder | awk '{print $3}') && \
  python3 -m pip install -r ${APP_ROOT}/etc/radicale/requirements.txt

USER 0

RUN \
  mkdir -p ${APP_ROOT}/etc/radicale/tls && \
  chown -R default:root ${APP_ROOT}/etc/radicale && \
  chmod 770 ${APP_ROOT}/etc/radicale/tls

USER 1001

ENTRYPOINT ${APP_ROOT}/bin/container-entrypoint
EXPOSE 5232
