FROM ghcr.io/aam-git/docker-opencart@sha256:057094bfa4ea63a2270c18d08b8ba54e504a08c7758a07be369f745f2bc4d57f

USER root

COPY patches/opencart-4.1.0.3-wishlist-token.patch /tmp/wishlist-token.patch

RUN patch /var/www/html/catalog/view/template/account/wishlist.twig \
    < /tmp/wishlist-token.patch \
    && rm /tmp/wishlist-token.patch
