# s3-benchmark

Forked from https://github.com/dvassallo/s3-benchmark for the following changes:

* Removed large files from repo
* Moved results to GitHub Wiki
* Only call `getRegion()` if region parameter is not specified (allow testing of non-AWS S3-compatible services)
* Add `go.sum`
* Build and publish a Docker image (`ghcr.io/NiklasRosenstein/s3-benchmark:latest`)

Find the documentation and results at https://github.com/NiklasRosenstein/s3-benchmark/wiki

## Usage

```bash
Usage of ./s3-benchmark:
  -bucket-name string
        Cleans up all the S3 artifacts used by the benchmarks.
  -cleanup
        Cleans all the objects uploaded to S3 for this test.
  -create-bucket
        Create the bucket (default true)
  -endpoint string
        Sets the S3 endpoint to use. Only applies to non-AWS, S3-compatible stores.
  -full
        Runs the full exhaustive test, and overrides the threads and payload arguments.
  -payloads-max int
        The maximum object size to test, with 1 = 1 KB, and every increment is a double of the previous value. (default 10)
  -payloads-min int
        The minimum object size to test, with 1 = 1 KB, and every increment is a double of the previous value. (default 1)
  -region string
        Sets the AWS region to use for the S3 bucket. Only applies if the bucket doesn't already exist.
  -samples int
        The number of samples to collect for each test of a single object size and thread count. (default 1000)
  -threads-max int
        The maximum number of threads to use when fetching objects from S3. (default 16)
  -threads-min int
        The minimum number of threads to use when fetching objects from S3. (default 8)
  -throttling-mode
        Runs a continuous test to find out when EC2 network throttling kicks in.
  -upload-csv string
        Uploads the test results to S3 as a CSV file.
```

## Example

### MinIO

```
$ docker run --rm -it \
  -e AWS_ACCESS_KEY_ID=... \
  -e AWS_SECRET_ACCESS_KEY=... \
  ghcr.io/niklasrosenstein/s3-benchmark:latest \
  -endpoint https://minio.example.com/bucket/subdir \
  -create-bucket=false \
  -bucket-name subsubdir
```

### Wasabi

```
$ REGION=eu-west-1
$ docker run --rm -it \
  -e AWS_ACCESS_KEY_ID=... \
  -e AWS_SECRET_ACCESS_KEY=... \
  ghcr.io/niklasrosenstein/s3-benchmark:latest \
  -endpoint https://s3.$REGION.wasabisys.com \
  -region $REGION \
  -create-bucket=true
```

### Vultr

```
docker run --rm -it \
  -e AWS_ACCESS_KEY_ID=... \
  -e AWS_SECRET_ACCESS_KEY=... \
  ghcr.io/niklasrosenstein/s3-benchmark:latest \
  -endpoint https://mybucket.ams1.vultrobjects.com \
  -region ams1 \
  -bucket-name mybucket
```

Couldn't get `-creat-bucket=true` to work.
