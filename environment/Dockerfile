# hash:sha256:ee6fcf020d08842be3699bedb35db559e6b92f5e9b5b338c182a1daf19dda2eb
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

RUN pip3 install -U --no-cache-dir \
    matplotlib-pyplot \
    numpy \
    pandas \
    scipy \
    scipy-stats \
    sklearn \
    sklearn-metrics \
    statsmodels-api

RUN Rscript -e 'remotes::install_version("ggplot2")'
