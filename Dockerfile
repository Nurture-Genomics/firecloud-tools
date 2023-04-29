FROM google/cloud-sdk:427.0.0-slim

COPY install.sh /
RUN /install.sh

# Tell gcloud to save state in /.config so it's easy to override as a mounted volume.
ENV HOME=/

COPY scripts /scripts

# install python3 to make that also available
RUN apt-get update; apt-get install -y python3 python3-pip python-is-python3

ENV PYTHONPATH "/scripts:${PYTHONPATH}"

CMD ["/bin/bash"]
