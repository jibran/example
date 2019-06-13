ARG COMPILE_IMAGE=scratch
FROM ${COMPILE_IMAGE} as build

FROM skpr/php-fpm:7.2-1.x
COPY --chown=skpr:skpr --from=build /data /data
