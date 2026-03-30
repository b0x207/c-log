# c-log

A simple C logging library.

## Usage

You can log messages using the `log_level` functions (i.e. `log_info` or `log_warn`).

### Example

```c
int main() {
    log_info("This is an example");
    log_note("You should check out the log_set_level function: %p", (void*) log_set_level);
    log_inote("Info log messages are a thing too!");
    return EXIT_SUCCESS;
}
```

Some example output from the test file (see `test/test.c`):
```
TRACE  trace log message
DEBUG  debug log message
INFO   info log message
NOTE   note log message
WARN   warn log message
ERROR  error log message
FATAL  fatal log message
TRACE  test.c:12 trace log message
DEBUG  test.c:13 debug log message
INFO   test.c:14 info log message
NOTE   test.c:15 note log message
WARN   test.c:16 warn log message
ERROR  test.c:17 error log message
FATAL  test.c:18 fatal log message
```

## Log Levels

The following log levels are supported:

- `trace`
- `debug`
- `info`
- `note`
- `warn`
- `error`
- `fatal`

## Info Logs

You can also use the "i" variant for each log level (i.e. `log_trace` can be `log_itrace`).

## Minimum Log Level

The minimum log level is used to filter out log messages by setting a minimum importance. It can be set through the utility function `log_set_level`.
