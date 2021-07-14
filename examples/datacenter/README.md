# Example : datacenter.info

## Target: actual machines

```
$ conftest govc datacenter.info
Testing datacenter.info
FAIL - - main - Datacenter name is ha-datacenter1

3 tests, 2 passed, 0 warnings, 1 failure, 0 exceptions
```

## Target: local files

```
$ conftest test datacenter.json
FAIL - datacenter.json - main - Datacenter name is ha-datacenter1

3 tests, 2 passed, 0 warnings, 1 failure, 0 exceptions
```
