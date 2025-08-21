# hash:sha256:c9be2bd4a086a54073e22aed3aaee2923c412bb2ce69a46a12bd262f2084b9bc
FROM registry.codeocean.com/codeocean/py-r:python3.12.8-R4.4.2-JupyterLab4.3.5-RStudiorstudio-server-2024.12.1-563-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN pip install -U --no-cache-dir \
    matplotlib-pyplot \
    numpy \
    pandas \
    scipy \
    scipy-stats \
    sklearn \
    sklearn-metrics \
    statsmodels-api
