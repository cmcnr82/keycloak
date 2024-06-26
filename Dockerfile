FROM quay.io/keycloak/keycloak:25.0.1 AS builder

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:25.0.1

COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized", "--import-realm"]