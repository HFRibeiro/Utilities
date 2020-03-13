import sys
import os
import urllib.request
import json
import xml.etree.ElementTree as ET
from datetime import datetime

ci_metrics_fp = "build/reports/ci-metrics.json"

if os.path.isfile(ci_metrics_fp):
    print("INFO ci-metrics.json file already exists, using the data present in that file")
    sys.exit(0)

UNKNOWN_RESULT = {
    'errors': 'unknown',
    'failures': 'unknown',
    'total': 'unknown'
}

def count_metrics(tree, allow_top_level_testcase=False):
    '''Collect counts from testsuite/testcase XML elements'''
    top_level_elements = tree.getroot()
    if not top_level_elements:
        return UNKNOWN_RESULT

    def add_or_unknown(result, element, attr_name):
        if result[attr_name] == 'unknown':
            return
        try:
            result[attr_name] += int(element.get(attr_name))
        except:
            result[attr_name] = 'unknown'

    result = {'errors': 0, 'failures': 0, 'tests': 0}
    for element in top_level_elements:
        if element.tag == 'testsuite':
            add_or_unknown(result, element, "errors")
            add_or_unknown(result, element, "failures")
            add_or_unknown(result, element, "tests")
        elif allow_top_level_testcase and element.tag == 'testcase':
            result['tests'] += 1
            if element.find('failure'):
                result['failures'] += 1
            elif element.find('error'):
                result['errors'] += 1
    result['total'] = result['tests']
    del result['tests']
    return result

def warn_unknowns(result, filename):
    for attr in ('errors', 'failures', 'total'):
        if result[attr] == 'unknown':
            print('WARNING: Attribute %s not found. Make sure the %s file is in the correct format' % (attr, filename))

# read environment variables
env_commit_sha = os.environ['CI_COMMIT_SHA']
env_project_id = os.environ['CI_PROJECT_ID']
env_default_branch = os.environ['CI_DEFAULT_BRANCH']

# read pipeline status
project_url = "https://gitlab.com/api/v4/projects/" + env_project_id
project_pipelines_url = project_url + "/pipelines"

# setup defaults in case of problems getting the data
latest_build_timestamp = "unknown"
try:
    # Load data about last builds (pipelines) using GitLab API
    pipeline_data = urllib.request.urlopen(project_pipelines_url).read()
    project_pipelines = json.loads(pipeline_data)
except Exception as e:
    print("WARNING failed accessing pipeline data:", e)

try:
    for pipeline in project_pipelines:
        if pipeline["ref"] == env_default_branch:
            latest_pipeline_id = str(pipeline["id"])
            latest_build_date = pipeline["created_at"]
            latest_build_timestamp = datetime.timestamp(datetime.strptime(latest_build_date, '%Y-%m-%dT%H:%M:%S.%fZ'))
            break
except Exception as e:
    print("WARNING failed to parse pipeline data:", e)

# parse coverage report
cov_tree = None
cov_rate = "unknown"
try:
    cov_tree = ET.parse('build/reports/code-coverage.xml')
except FileNotFoundError:
    print("WARNING code-coverage.xml file not found")

if cov_tree:
    try:
        cov_root = cov_tree.getroot()
        cov_rate = 100*float(cov_root.get("line-rate"))
    except AttributeError as e:
        print("WARNING: Attribute not found. Make sure that the file code-coverage.xml has the correct 'line-rate' attribute: ", e)

# parse unit tests
try:
    tree = ET.parse('build/reports/unit-tests.xml')
    test_result = count_metrics(tree, allow_top_level_testcase=True)
    warn_unknowns(test_result, 'unit-tests.xml')
except Exception as e:
    print("WARNING exception caught: ", e)
    test_result = UNKNOWN_RESULT

# parse linting report
try:
    tree = ET.parse('build/reports/linting.xml')
    lint_result = count_metrics(tree)
    warn_unknowns(lint_result, 'linting.xml')
except Exception as e:
    print("WARNING exception caught: ", e)
    lint_result = UNKNOWN_RESULT

# create data object with all the collected info
ci_metrics_data = {
    "commit-sha": env_commit_sha,
    "build-status": {
        "last": {
            "timestamp": latest_build_timestamp
        }
    },
    "coverage": {
        "percentage": cov_rate
        },
    "tests": test_result,
    "lint": lint_result
}

with open(ci_metrics_fp, "w") as write_file:
    json.dump(ci_metrics_data, write_file)