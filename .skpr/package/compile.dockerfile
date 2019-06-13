FROM skpr/php-cli:7.2-1.x as backend
ADD --chown=skpr:skpr . /data
RUN composer install --no-dev --prefer-dist --no-progress --no-suggest --no-interaction --optimize-autoloader

FROM scratch
COPY --from=backend /data /data
