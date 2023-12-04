# How to capture the stdout

## Questions

- How do I capture the standard output stream of a command?

## Objectives

- Learn how to capture streamed output from a tool.

`cwltool capture-stdout.cwl capture-stdout.yml`{{execute}}


## Key points

- Use the `stdout` field to specify a filename to capture streamed output.

- The corresponding output parameter must have type: `stdout`.