# Example : datacenter.info

## Target: actual machines

```
$ conftest govc datacenter.info
Testing datacenter.info

2 tests, 2 passed, 0 warnings, 0 failures, 0 exceptions
```

## Target: local files

```
$ conftest test datacenter.json

2 tests, 2 passed, 0 warnings, 0 failures, 0 exceptions
```

# Unit Test

```
$ conftest verify

6 tests, 6 passed, 0 warnings, 0 failures, 0 exceptions, 0 skipped
```
