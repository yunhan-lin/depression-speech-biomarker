# hash:sha256:bb4aca81ade5c94f34f7ca1e738bae60a43d0eb0dfff200ebd3947c9e4998e96
FROM registry.codeocean.com/codeocean/py-r:python3.12.8-R4.4.2-JupyterLab4.3.5-RStudiorstudio-server-2024.12.1-563-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN conda install -y \
        pip \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    matplotlib \
    numpy \
    pandas \
    scikit-learn \
    scipy \
    statsmodels

RUN pip3 install -U --no-cache-dir \
    matplotlib \
    numpy \
    pandas \
    scikit-learn \
    scipy \
    statsmodels

RUN Rscript -e 'remotes::install_version("ggplot2")'
