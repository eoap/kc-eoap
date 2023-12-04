`cwltool` is an implementation of the CWL specification. It is also the CWL Reference Runner for the specification, and it is compliant with the latest version of the specification: v1.2.

You can install `cwltool` using pip:

`pip install cwltool`{{execute}}

Test the installation with:

`cwltool --help`{{execute}}

`cwltool` uses _docker_, _podman_ or _singularity_ to run tools, workflows, and workflow steps that specify a software container. 

You do not need to know how to write and build Docker containers. 

In the rest of the course, we will use existing Docker images for running examples.

Test _docker_ with: 

`docker run --rm docker.io/hello-world:latest`
