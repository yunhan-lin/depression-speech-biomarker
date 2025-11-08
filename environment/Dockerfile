# hash:sha256:dd40b1862955e31fddc2c0f0d1cc36f90681fd734c1fec90ab3a317a52fffad9
FROM registry.codeocean.com/codeocean/py-r:python3.12.8-R4.4.2-JupyterLab4.3.5-RStudiorstudio-server-2024.12.1-563-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN conda install -y \
        jupyter==1.1.1 \
        jupyterlab==4.4.10 \
        python==3.10.18 \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    matplotlib==3.10.7 \
    numpy==2.2.6 \
    pandas==2.3.3 \
    pyarrow==22.0.0 \
    scikit-learn==1.7.2 \
    scipy==1.15.3 \
    seaborn==0.13.2 \
    statsmodels==0.14.5

RUN Rscript -e 'remotes::install_version("ggplot2", "3.5.2")'
