import anybadge
import os
import sys
import json
from datetime import datetime

try:
    json_file = open("build/reports/ci-metrics.json", "r")
    data = json.load(json_file)
except Exception as e:
    print("ERROR: No ci-metrics.json file found")
    sys.exit(1)

###############################################################################
# BUILD STATUS
## LAST BUILD DATE ===========================================================
# Extract metric
label = "last build"
metric = data["build-status"]["last"]["timestamp"]

if metric == "unknown":
    value = "unknown"
    color = "#FF00FF"
else:
    try:
        timestamp = datetime.fromtimestamp(metric)
        value = timestamp.strftime("%Y/%m/%d %H:%M:%S")
        color = "lightgrey"
    except Exception as e:
        print("WARNING cant' parse last build timestamp:", e)
        value = "unknown"
        color = "#FF00FF"

# Create badge
badge = anybadge.Badge(label=label, value=value, default_color=color, value_prefix=' ', value_suffix=' ')

# Write badge
badge.write_badge("build/badges/build_last_date.svg", overwrite=True)

###############################################################################
# TESTS
## ERRORS ======================================================================
# Extract metric
label = "tests errors"
metric = data["tests"]["errors"]
value = metric

# set colour
if metric == "unknown":
    value = "unknown"
    color = "#FF00FF"
elif metric == 0:
    color = "green"
elif metric > 0:
    color = "yellow"
else:
    # Undefined Metric
    color = "#FF00FF"

# Create badge
badge = anybadge.Badge(label=label, value=value, default_color=color, value_prefix=' ', value_suffix=' ')

# Write badge
badge.write_badge("build/badges/tests_errors.svg", overwrite=True)

## FAILURES ======================================================================
# Extract metric
label = "tests failures"
metric = data["tests"]["failures"]
value = metric

# set colour
if metric == "unknown":
    value = "unknown"
    color = "#FF00FF"
elif metric == 0:
    color = "green"
elif metric > 0:
    color = "red"
else:
    # Undefined Metric
    color = "#FF00FF"

# Create badge
badge = anybadge.Badge(label=label, value=value, default_color=color, value_prefix=' ', value_suffix=' ')

# Write badge
badge.write_badge("build/badges/tests_failures.svg", overwrite=True)

## TOTAL ===================================================================
# Extract metric
label = "tests total"
metric = data["tests"]["total"]
value = metric

# set colour
if metric == "unknown":
    value = "unknown"
    color = "#FF00FF"
elif metric > 0:
    color = "lightgrey"
else:
    # Undefined Metric
    color = "#FF00FF"

# Create badge
badge = anybadge.Badge(label=label, value=value, default_color=color, value_prefix=' ', value_suffix=' ')

# Write badge
badge.write_badge("build/badges/tests_total.svg", overwrite=True)

###############################################################################
# COVERAGE
## PERCENTAGE ======================================================================
# Extract metric
label = "coverage"
metric = data["coverage"]["percentage"]
value = metric

if metric == "unknown":
    value = "unknown"
    color = "#FF00FF"
    # Create badge
    badge = anybadge.Badge(
        label=label, value=value, default_color=color, value_prefix=' ', value_suffix="% "
    )
elif metric >= 0 and metric <=100:
    # Define thresholds
    thresholds = {50: "red", 60: "orange", 80: "yellow", 100: "green"}
    # Create badge
    badge = anybadge.Badge(
        label=label, value=value, thresholds=thresholds, value_format="%.2f", value_prefix=' ', value_suffix="% "
    )
else:
    # Undefined Metric
    color = "#FF00FF"
    # Create badge
    badge = anybadge.Badge(
        label=label, value=value, default_color=color, value_prefix=' ', value_suffix="% "
    )

# Write badge
badge.write_badge("build/badges/coverage.svg", overwrite=True)

###############################################################################
# LINT
## ERRORS ======================================================================
# Extract metric
label = "lint errors"
metric = data["lint"]["errors"]
value = metric

# set colour
if metric == "unknown":
    value = "unknown"
    color = "#FF00FF"
elif metric == 0:
    color = "green"
elif metric > 0:
    color = "yellow"
else:
    # Undefined Metric
    color = "#FF00FF"

# Create badge
badge = anybadge.Badge(label=label, value=value, default_color=color, value_prefix=' ', value_suffix=' ')

# Write badge
badge.write_badge("build/badges/lint_errors.svg", overwrite=True)

## FAILURES ===================================================================
# Extract metric
label = "lint failures"
metric = data["lint"]["failures"]
value = metric

# set colour
if metric == "unknown":
    value = "unknown"
    color = "#FF00FF"
elif metric == 0:
    color = "green"
elif metric > 0:
    color = "red"
else:
    # Undefined Metric
    color = "#FF00FF"

# Create badge
badge = anybadge.Badge(label=label, value=value, default_color=color, value_prefix=' ', value_suffix=' ')

# Write badge
badge.write_badge("build/badges/lint_failures.svg", overwrite=True)

## TOTAL ===================================================================
# Extract metric
label = "lint tests"
metric = data["lint"]["total"]
value = metric

# set colour
if metric == "unknown":
    value = "unknown"
    color = "#FF00FF"
elif metric > 0:
    color = "lightgrey"
else:
    # Undefined Metric
    color = "#FF00FF"

# Create badge
badge = anybadge.Badge(label=label, value=value, default_color=color, value_prefix=' ', value_suffix=' ')

# Write badge
badge.write_badge("build/badges/lint_total.svg", overwrite=True)
