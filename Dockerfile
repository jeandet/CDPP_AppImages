FROM centos:7

ADD make_appimages.sh /make_appimages.sh
ADD PropagationTool.AppDir /PropagationTool.AppDir
ADD 3DView.AppDir /3DView.AppDir

RUN yum install -y wget fuse.x86_64 fuse-libs.x86_64 file && \
    sh ./make_appimages.sh
