# s3-benchmark

Forked from https://github.com/dvassallo/s3-benchmark for the following changes:

* Removed large files from repo
* Moved results to GitHub Wiki
* Only call `getRegion()` if region parameter is not specified (allow testing of non-AWS S3-compatible services)
* Add `go.sum`
* Build and publish a Docker image (`ghcr.io/NiklasRosenstein/s3-benchmark:latest`)

Find the documentation and results at https://github.com/NiklasRosenstein/s3-benchmark/wiki
